import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_details.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_liked.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class DishMenuItem extends StatelessWidget {
//   const DishMenuItem({
//     super.key,
//     required this.dish,
//     required this.onToggleFavorite,
//   });

//   final DishModel dish;
//   final Function(int) onToggleFavorite;

//   @override
//   Widget build(BuildContext context) {
//     final isFavorite = context
//         .read<MenuItemCubit>()
//         .state
//         .favoriteDishIds
//         .contains(dish.dishId);
//     final favoriteCounter =
//         context.read<MenuItemCubit>().state.favoriteCounts[dish.dishId] ?? 0;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.grey.shade300,
//           width: 1,
//         ),
//       ),
//       child: InkWell(
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (ctx) => DishDetails(dish: dish),
//             ),
//           );
//         },
//         child: Stack(
//           children: [
//             Positioned(
//               top: 0,
//               right: 0,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 // child: Hero(
//                 //   tag: dish,
//                 //   child: Image.asset(
//                 //     dish.dishImage,
//                 //     fit: BoxFit.contain,
//                 //     height: 100,
//                 //     width: 140,
//                 //   ),
//                 // ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   dish.dishName,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   '${dish.dishPrice} PLN',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.brown,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Container(
//                   constraints: const BoxConstraints(maxWidth: 220),
//                   child: Text(
//                     dish.dishIngredients,
//                     style: const TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     if (dish.isDishNew)
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.local_fire_department,
//                             size: 16,
//                             color: Colors.red.shade600,
//                           ),
//                           const SizedBox(width: 5),
//                           Text(
//                             'Nowość',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.red.shade600,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     if (dish.isDishNew && dish.isDishVegetarian)
//                       const SizedBox(width: 20),
//                     if (dish.isDishVegetarian)
//                       Row(
//                         children: [
//                           FaIcon(
//                             FontAwesomeIcons.leaf,
//                             size: 16,
//                             color: Colors.green.shade800,
//                           ),
//                           const SizedBox(width: 5),
//                           Text(
//                             'Vege',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.green.shade800,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.access_time,
//                       size: 16,
//                     ),
//                     const SizedBox(width: 5),
//                     Text(
//                       '${dish.dishCookTime}min',
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                     const SizedBox(width: 30),
//                     Icon(
//                       dish.isDishRecommended
//                           ? Icons.thumb_up_alt
//                           : Icons.thumb_up_alt_outlined,
//                       size: 16,
//                     ),
//                     const SizedBox(width: 5),
//                     const Text(
//                       'Polecany',
//                       style: TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                     const Spacer(),
//                     DishLiked(
//                       dish: dish,
//                       isFavorite: isFavorite,
//                       favoriteCounter: favoriteCounter,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class DishMenuItem extends StatelessWidget {
  const DishMenuItem({
    super.key,
    required this.dish,
    required this.onToggleFavorite,
  });

  final DishModel dish;
  final Function(int) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.read<MenuItemCubit>().state.favoriteDishIds.contains(dish.dishId);
    final favoriteCounter =
        context.read<MenuItemCubit>().state.favoriteCounts[dish.dishId] ?? 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => DishDetails(dish: dish),
            ),
          );
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: dish,
                  child: Image.asset(
                    dish.dishImage,
                    fit: BoxFit.contain,
                    height: 100,
                    width: 140,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.dishName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${dish.dishPrice} PLN',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  constraints: const BoxConstraints(maxWidth: 220),
                  child: Text(
                    dish.dishIngredients,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    if (dish.isDishNew)
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            size: 16,
                            color: Colors.red.shade600,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Nowość',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    if (dish.isDishNew && dish.isDishVegetarian)
                      const SizedBox(width: 20),
                    if (dish.isDishVegetarian)
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.leaf,
                            size: 16,
                            color: Colors.green.shade800,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Vege',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${dish.dishCookTime}min',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Icon(
                      dish.isDishRecommended
                          ? Icons.thumb_up_alt
                          : Icons.thumb_up_alt_outlined,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Polecany',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    DishLiked(
                      dish: dish,
                      isFavorite: isFavorite,
                      favoriteCounter: favoriteCounter,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
