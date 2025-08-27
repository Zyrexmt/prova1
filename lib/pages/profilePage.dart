import 'package:flutter/material.dart';
import 'package:prova1_2/global/variaveis.dart';
import 'package:prova1_2/services/infosUser.dart';
import 'package:prova1_2/widgets/InputFieldWidget.dart';
import 'package:prova1_2/widgets/ReturnStartWidget.dart';
import 'package:prova1_2/widgets/SidebarWidget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nomeController = TextEditingController(),
  cidadeController = TextEditingController(),
  cursoController = TextEditingController();

  @override
  void initState(){
    super.initState();
    carregarDadosUsuario();
  }

  Future<void> carregarDadosUsuario() async {
    final infosUser = Infosuser();
    final userData = await infosUser.getUserData();

    if(userData != null) {
      setState(() {
        nomeController.text = userData['nome_completo'] ?? '';
        cidadeController.text = userData['cidade'] ?? '';
        cursoController.text = userData['curso'] ?? '';
        print('🔹 userData carregado no perfil: $userData');
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
        leading: Builder(
      builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu, size: 30,),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
    ),
    drawer: SideBarMenu(),

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children:[
                Image.asset(
                  'assets/images/user.png', scale: 2
                  ),
                  SizedBox(height: 20,),
                  Text('Perfil', style: TextStyle(fontSize: 16),)
                ]
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            
            InputField(nomeController, 'Nome completo', true),
            SizedBox(height: 20,),
            InputField(cidadeController, 'Cidade', true),
            SizedBox(height: 20,),
            InputField(cursoController, 'Curso', false),
            Padding(padding: EdgeInsets.symmetric(vertical: 25)),
            ElevatedButton(onPressed: (
              ) {
                Navigator.of(context).pushReplacementNamed('');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                fixedSize: Size(135, 40)

              ), child:
              Text('Mudar senha'),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ElevatedButton(onPressed: (
              ) {
                print(user);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,  
                foregroundColor: Colors.white,
                fixedSize: Size(135, 40),
              ),
               child:
              Text('Atualizar'),
            ),
          ],
        ),
      ),
      ),
    );
  }
}