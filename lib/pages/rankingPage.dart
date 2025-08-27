import 'package:flutter/material.dart';
import 'package:prova1_2/widgets/SidebarWidget.dart';
import 'package:prova1_2/widgets/PointRankingWidget.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(onPressed: () {
            Scaffold.of(context).openDrawer();
           }, 
           icon: Icon(Icons.menu, size: 30,));
        })
      ),
      drawer: SideBarMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(child: Icon(Icons.trending_up, size: 70),),
              Text('Ranking - Paraná', style: TextStyle(fontSize: 20),)
            ],
          ),
          
          Flexible(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return PointRanking(posicao: index+1, nome: 'Matheus', pontos: 10, foto: 'assetes/images/user.png');
              },
            ),
          ),
      
        Padding(padding: EdgeInsets.only(bottom: 30)),
        ],
      )
    );
  }
}