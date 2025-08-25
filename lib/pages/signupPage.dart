import 'package:flutter/material.dart';
import 'package:prova1_2/widgets/InputFieldWidget.dart';
import 'package:prova1_2/widgets/ReturnStartWidget.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

 String nome = '', cidade = '', curso = '',email = '', senha = '';

TextEditingController nomeController = TextEditingController(),
cidadeController = TextEditingController(),
cursoController = TextEditingController(),
emailController = TextEditingController(),
senhaController = TextEditingController();




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
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              Icon(Icons.flutter_dash, size: 80, color: Colors.blue,),
              InputField(nomeController, 'Nome Completo', true),
              InputField(cidadeController, 'Cidade', true),
              InputField(cursoController, 'Curso', true),
              InputField(emailController, 'Email', true),
              InputField(senhaController, 'Senha', true),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              ElevatedButton(onPressed: (
              ) {
                Navigator.of(context).pushReplacementNamed('/matter');
              print(nomeController.text);
              print(cidadeController.text);
              print(cursoController.text);
              print(emailController.text);
              print(senhaController.text);


              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white
              ), child:
              Text('Entrar'),
            )
            ],
            ),
        ),
        ),
      );
  }
}





              // Icon(Icons.flutter_dash, size: 100, color: Colors.blue,),
              // SizedBox(height: 25,),
              // Row(children: [
              // Text('Nome Completo', style: TextStyle(fontSize: 16),)
              // ],),
              // TextField(
              //   controller: nomeController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              // Row(children: [
              // Text('Cidade', style: TextStyle(fontSize: 16),)
              // ],),
              // TextField(
              //   controller: cidadeController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              // Row(children: [
              // Text('Curso', style: TextStyle(fontSize: 16),)
              // ],),
              // TextField(
              //   controller: cursoController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              // Row(children: [
              // Text('Email', style: TextStyle(fontSize: 16),)
              // ],),
              // TextField(
              //   controller: emailController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              // Row(children: [
              // Text('Senha', style: TextStyle(fontSize: 16),)
              // ],),
              // TextField(
              //   controller: senhaController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              