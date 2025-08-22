import 'package:flutter/material.dart';
import 'package:prova1_2/pages/homePage.dart';
import 'package:prova1_2/pages/loginPage.dart';
import 'package:prova1_2/pages/splashPage.dart';
import 'package:prova1_2/pages/welcomePage.dart';

import 'appController.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: Appcontroller.instance, builder: (context, child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        routes: {
          '/splash': (context) => const SplashPage(),
          '/welcome': (context) => const WelcomePage(), 
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
        },

        initialRoute: Appcontroller.instance.splashCompleted ? '/welcome' : '/splash',
      );
    });
  }
}