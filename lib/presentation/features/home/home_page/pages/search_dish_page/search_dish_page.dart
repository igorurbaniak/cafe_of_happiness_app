import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/pages/search_dish_page/cubit/search_dish_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDishPage extends StatelessWidget {
  const SearchDishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchDishCubit>();

    return Scaffold(
      appBar: const BackAppBar(title: 'Wyszukaj w menu'),
      body: BlocBuilder<SearchDishCubit, SearchDishState>(
        bloc: cubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.brown.shade800,
                      width: 1.2,
                    ),
                  ),
                  child: TextField(
                    autofocus: true,
                    controller: cubit.searchController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nazwa dania ...',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      hintStyle:
                          TextStyle(fontSize: 18, color: Colors.grey.shade500),
                      suffixIcon: state.hasText
                          ? IconButton(
                              onPressed: () => cubit.clearSearch(),
                              icon: const Icon(Icons.clear),
                            )
                          : const Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      cubit.search(query);
                    },
                  ),
                ),
                const SizedBox(height: 30),
                if (state.status == Status.loading)
                  const CircularProgressIndicator()
                else if (state.status == Status.error)
                  Text(state.errorMessage.toString())
                else if (state.suggestions != null &&
                    state.suggestions!.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      shrinkWrap: true,
                      itemCount: state.suggestions!.length,
                      itemBuilder: (context, index) {
                        final suggestion = state.suggestions![index];
                        final dish = state.dishes
                            .firstWhere((dish) => dish.dishName == suggestion);

                        return ListTile(
                          key: UniqueKey(),
                          onTap: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => DishDetails(
                                  dish: dish,
                                ),
                              ),
                            );
                          },
                          leading: Image.asset(
                            dish.dishImage,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                          title: Text(suggestion),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}