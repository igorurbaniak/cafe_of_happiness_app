import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zaloguj się'),
      ),
      body: Center(
        child: Column(
          children: [Image.asset('/images/coffee_logo.png')],
        ),
      ),
    );
  }
}
