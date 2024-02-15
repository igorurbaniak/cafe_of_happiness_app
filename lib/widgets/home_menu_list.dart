import 'package:cafe_of_happiness_app/screens/menu_meal_screen.dart';
import 'package:flutter/material.dart';

class HomeMenuList extends StatelessWidget {
  const HomeMenuList({super.key});

  // void _selectCategory(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (ctx) => const MenuScreen(
  //         title: 'Some title',
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final items = [
      'JEDZENIE 🥪',
      'NAPOJE ☕',
      'ZESTAWY 😍',
      'TYLKO U NAS 🤫',
      'DESERY 🍰',
      'PÓŁKA SKLEPOWA 😋',
    ];

    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisSize: MainAxisSize.min,
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
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const MenuScreen(
                        title: 'Some title',
                      ),
                    ),
                  );
                },
                child: Card(
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
                ),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
