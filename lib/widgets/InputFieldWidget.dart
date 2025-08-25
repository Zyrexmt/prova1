import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(this.controller, this.titulo, this.escolha, {super.key});
  final TextEditingController controller;
  final String titulo;
  final bool escolha;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(titulo, style: TextStyle(fontSize: 16),),
              ],
            ),
            TextField(
              controller: controller,
              enabled: escolha,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), )
              ),
            )
          ],
        ),
      ),
    )
    ;
  }
}