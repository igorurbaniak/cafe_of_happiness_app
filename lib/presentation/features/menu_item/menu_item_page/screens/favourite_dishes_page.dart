import 'package:flutter/material.dart';

class FavoriteDishesPage extends StatelessWidget {
  const FavoriteDishesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🖤  Twoje ulubione'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.heart_broken_rounded,
              size: 100,
            ),
            const SizedBox(height: 50),
            const Text(
              'Nie masz nic ulubionych  🥺',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  'Powrót do menu',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
