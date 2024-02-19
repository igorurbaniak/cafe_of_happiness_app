import 'package:flutter/material.dart';

class DishDiscription extends StatelessWidget {
  const DishDiscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'images/crossaint.jpg',
                fit: BoxFit.cover,
                height: 100,
                width: 140,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Wspomnienie\nznad morza',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                '28 PLN',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              ),
              const SizedBox(height: 5),
              const Text(
                'croissant, łosoś, kremowy serek\nlabne, pomidorki koktajolwe\nkapary, rukola, sos cytrynowy,\nsmażone nasiona',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 5),
                  const Text(
                    '16min',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 30),
                  const Icon(Icons.thumb_up_alt_outlined, size: 16),
                  const SizedBox(width: 5),
                  const Text(
                    'Polecany',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 108),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.favorite_outline_outlined),
                                Center(
                                  child: Text('20'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
