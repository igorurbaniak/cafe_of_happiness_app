import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/pages/search_dish_page/cubit/search_dish_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDishPage extends StatelessWidget {
  const SearchDishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchDishCubit>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const BackAppBar(title: 'Wyszukaj w menu'),
      body: BlocBuilder<SearchDishCubit, SearchDishState>(
        bloc: cubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                _buildSearchField(context, cubit, state),
                const SizedBox(height: 30),
                _buildResults(state, cubit),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchField(
      BuildContext context, SearchDishCubit cubit, SearchDishState state) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
          width: 1,
        ),
      ),
      child: TextField(
        autofocus: true,
        controller: cubit.searchController,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.secondaryContainer,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Nazwa dania',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.secondaryContainer),
          suffixIcon: state.hasText
              ? IconButton(
                  onPressed: cubit.clearSearch,
                  icon: Icon(Icons.clear,
                      color: Theme.of(context).colorScheme.secondaryContainer),
                )
              : Icon(Icons.search,
                  color: Theme.of(context).colorScheme.secondaryContainer),
        ),
        onChanged: cubit.search,
      ),
    );
  }

  Widget _buildResults(SearchDishState state, SearchDishCubit cubit) {
    if (state.status == Status.loading) {
      return const CircularProgressIndicator();
    } else if (state.status == Status.error) {
      return Text(state.errorMessage ?? 'An error occurred');
    } else if (state.suggestions != null && state.suggestions!.isNotEmpty) {
      return Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 30),
          shrinkWrap: true,
          itemCount: state.suggestions!.length,
          itemBuilder: (context, index) {
            final suggestion = state.suggestions![index];
            final dish =
                state.dishes.firstWhere((dish) => dish.dishName == suggestion);

            return ListTile(
              key: UniqueKey(),
              onTap: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => DishDetails(dish: dish),
                  ),
                );
              },
              contentPadding: EdgeInsets.zero,
              leading: ClipOval(
                child: Image.asset(
                  dish.dishImage,
                  height: 60,
                  width: 55,
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(Icons.error,
                          color: Theme.of(context).colorScheme.error)),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  suggestion,
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
