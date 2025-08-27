import 'package:flutter/material.dart';

class PointRanking extends StatelessWidget {
  const PointRanking({required this.posicao, required this.nome, required this.pontos, required this.foto, super.key});

  final int posicao;
  final String nome;
  final int pontos;
  final String foto;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade700),
        ),
        child: Row(
          children: [
            Text(
              "$posicao -",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 12,),
      
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(foto),
            ),
            const SizedBox(width: 12,),
      
            Expanded(child: Text(
              nome,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
           ),
           Text('$pontos pts',
           style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
           ),
           ),
          ],
        ),
      );
  }
}