import 'package:flutter/material.dart';

class ReturnStartButton extends StatelessWidget {
  const ReturnStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/welcome');
      },
    );
  }
}