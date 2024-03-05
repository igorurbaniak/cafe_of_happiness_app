import 'package:flutter/material.dart';

class HomeDiscription extends StatelessWidget {
  const HomeDiscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: const Stack(
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
            top: 5,
            right: 35,
            child: Image(
              image: AssetImage('images/coffee_logo.png'),
              width: 80,
              height: 80,
            ),
          ),
          Positioned(
            top: 100,
            child: Wrap(
              children: [
                Text(
                  'A place where coffee tastes like a smile and every \nsip is a snippet of joy. Come and discover the magic\nin a cup and tasty appetizers.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
