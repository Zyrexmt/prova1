import 'package:flutter/material.dart';
import 'package:prova1_2/appController.dart';
import 'package:prova1_2/pages/welcomePage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Appcontroller.instance.completeSplash();

      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const WelcomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Icon(Icons.flutter_dash, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text("Senai Test", style: TextStyle(fontSize: 28, color: Colors.white)),
          ],
        ),
      )
    );
  }
}

