import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
                'Good',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue[800]),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, 
              foregroundColor: Colors.white), 
              child: Text('Login'),
            ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, 
              foregroundColor: Colors.white), 
              child: Text('Cadastro'),
              )
          ],
        )
      )
    );
  }
}

