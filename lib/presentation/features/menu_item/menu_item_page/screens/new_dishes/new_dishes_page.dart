import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:flutter/material.dart';

class NewDishesPage extends StatelessWidget {
  const NewDishesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackAppBar(title: '🔥  Nowości'),
      body:  Center(
              child: Text(
                'Nowości wkrótce u Nas  👀',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
    );
  }
}
