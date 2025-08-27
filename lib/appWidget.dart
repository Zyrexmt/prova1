import 'package:flutter/material.dart';
import 'package:prova1_2/pages/matterPage.dart';
import 'package:prova1_2/pages/loginPage.dart';
import 'package:prova1_2/pages/profilePage.dart';
import 'package:prova1_2/pages/rankingPage.dart';
import 'package:prova1_2/pages/signupPage.dart';
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
          '/matter': (context) => const MatterPage(),
          '/signup': (context) => const SignUp(),
          '/profile': (context) => const ProfilePage(),
          '/ranking': (context) => const RankingPage(),
        },

        initialRoute: Appcontroller.instance.splashCompleted ? '/welcome' : '/splash',
      );
    });
  }
}