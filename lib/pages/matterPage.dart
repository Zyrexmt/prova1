import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova1_2/services/infosDao.dart';
import 'package:prova1_2/services/infosUser.dart';
import 'package:prova1_2/widgets/MateriaCardWidget.dart';
import 'package:prova1_2/widgets/SidebarWidget.dart';

class  MatterPage extends StatefulWidget {
  const  MatterPage({super.key});

  @override
  State< MatterPage> createState() => _MatterPageState();
}

class _MatterPageState extends State< MatterPage> {
  List<dynamic> materias = [];


  @override
  void initState() {
    super.initState();
    carregarMaterias();
  }

  Future<void> carregarMaterias() async {
    final userData = await Infosuser().getUserData();
    if (userData != null) {
      int alunoId = userData['id'];
      List<dynamic> disciplinas = await InfosDao().buscarDisciplinas(alunoId);

        print("Disciplinas recebidas: $disciplinas");

        setState(() {
          materias = disciplinas;
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
      },
    ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30,))],
    ),
    drawer: SideBarMenu(),

      body: SingleChildScrollView(
        child: Column(
          children: materias.map((disciplina) {
            return MateriaCard(disciplina['nome_disciplina']);
          }).toList(),
        ),
      )
    );
  }
}