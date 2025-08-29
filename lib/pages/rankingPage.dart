import 'package:flutter/material.dart';
import 'package:prova1_2/services/infosDao.dart';
import 'package:prova1_2/services/infosUser.dart';
import 'package:prova1_2/widgets/SidebarWidget.dart';
import 'package:prova1_2/widgets/PointRankingWidget.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}
class _RankingPageState extends State<RankingPage> {

  List<dynamic> rankingTop10 = [];


  @override
  void initState() {
    super.initState();
    carregarRanking();
  }

  Future<void> carregarRanking() async {
    final userData = await Infosuser().getUserData();
    if(userData != null) {
      int alunoId = userData['id'];

      List<dynamic> ranking = await InfosDao().rankingTop10(alunoId);
      print('ranking recebido: $ranking');

      setState(() {
        rankingTop10 = ranking;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
                int posicaoRanking = 1;
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
              child: ListView(
              children: rankingTop10.map((rank) {
                return PointRanking(posicaoRanking++, rank['aluno'], rank['pontos'], rank['foto']);
              }).toList(),
                        ),
            ),
      
        Padding(padding: EdgeInsets.only(bottom: 30)),
        ],
      )
    );
  }
}