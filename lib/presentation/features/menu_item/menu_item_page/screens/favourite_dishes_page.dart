import 'package:flutter/material.dart';

class FavoriteDishesPage extends StatelessWidget {
  const FavoriteDishesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 100,
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.brown.shade500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          iconSize: 32,
          onPressed: () => Navigator.of(context).pop(),
        ),
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
