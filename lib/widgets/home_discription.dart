import 'package:flutter/material.dart';

class HomeDiscription extends StatelessWidget {
  const HomeDiscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
      child: const Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            top: 20,
            child: Text(
              'Cafe of Happiness',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Text(
              'Cafeteria',
            ),
          ),
          Positioned(
            right: 30,
            child: Image(
              image: AssetImage('images/coffee_logo.png'),
              width: 80,
              height: 80,
            ),
          ),
          Positioned(
            top: 100,
            child: Text(
                'A place where coffee tastes like a smile and every sip is \na snippet of joy. Come and discover the magic in a cup.'),
          ),
        ],
      ),
    );
  }
}
