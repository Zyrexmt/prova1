import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prova1_2/global/variaveis.dart';
import 'package:prova1_2/services/infosDao.dart';
import 'package:prova1_2/services/infosUser.dart';
import 'package:prova1_2/widgets/ReturnStartWidget.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool mantenhaConectado = false;
  String email = '', senha = '';
  TextEditingController emailController = TextEditingController(),
  senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    bool conectado = await Infosuser().userConectado();
    if(conectado) {
      bool biometriaValidada = await methodChannel.invokeMethod(
        'biometria',
      );
      if (biometriaValidada) {
        user = jsonDecode(
          await methodChannel.invokeMethod(user),
        );
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }
  }

  void validarLogin() async {
    email = emailController.text.toString().trim();
    senha = senhaController.text.toString().trim();
    int tipoErro = 0;


    switch(tipoErro){
      case 0: 
        await InfosDao().validarLogin(email, senha);
        if(user.toString().isNotEmpty) {
          await Infosuser().salvarInfo(user, mantenhaConectado);
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          print('erro login');
        }
        break;
      case 1:
      print('erro email');
        break;
      case 2:
      print('erro senha');
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: ReturnStartButton(),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash, size: 100, color: Colors.blue),
            SizedBox(height: 25),
            TextField(
              controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: senhaController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              border: OutlineInputBorder()
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(value: mantenhaConectado, onChanged: (newValue) {
                  setState(() {
                    mantenhaConectado = newValue!;
                    });
                  },
                ),
                Text('mantenha-me conectado'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: validarLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white
              ), child:
              Text('Entrar'),
            )
          ],
        ),
        ),
      )
    );
  }
}