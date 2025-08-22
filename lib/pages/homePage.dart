import 'package:flutter/material.dart';
import 'package:prova1_2/widgets/MateriaCardWidget.dart';
import 'package:prova1_2/widgets/SidebarWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          children: [
            MateriaCard('Nome da matéria'),
            MateriaCard('Nome da matéria'),
            MateriaCard('Nome da matéria'),
            MateriaCard('Nome da matéria'),
            MateriaCard('Nome da matéria'),
            MateriaCard('Nome da matéria'),
            MateriaCard('Nome da matéria'),
          ],
        ),
      )
    );
  }
}