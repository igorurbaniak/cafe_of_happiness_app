import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  icon: const Icon(Icons.star),
                  label: const Text('Popular'),
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  icon: const Icon(Icons.favorite),
                  label: const Text('Favorites: 0'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100, width: double.infinity),
        ],
      ),
    );
  }
}
