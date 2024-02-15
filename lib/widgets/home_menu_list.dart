import 'package:flutter/material.dart';

class HomeMednuList extends StatelessWidget {
  const HomeMednuList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'JEDZENIE 🥪',
      'NAPOJE 🍼',
      'ZESTAWY 😍',
      'TYLKO U NAS 🤫',
      'DESERY 🍰',
      'PÓŁKA SKLEPOWA 😋',
    ];

    return Expanded(
      child: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black12,
                    thickness: 1.5,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'MENU:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    color: Colors.black12,
                    thickness: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade200, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  shadowColor: Colors.grey.shade100,
                  elevation: 0.3,
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      items[index],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
