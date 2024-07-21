import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDescription extends StatelessWidget {
  const HomeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: 200,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            child: Text(
              AppLocalizations.of(context)!.cafe_of_happines,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Positioned(
            top: 50,
            child: Text(
              AppLocalizations.of(context)!.cafetria,
            ),
          ),
          const Positioned(
            right: 25,
            child: Image(
              image: AssetImage('images/coffee_logo.png'),
              width: 90,
              height: 90,
            ),
          ),
          Positioned(
            top: 100,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: Text(
                AppLocalizations.of(context)!.place_where_coffee_tastes,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
