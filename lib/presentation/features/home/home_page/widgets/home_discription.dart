import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDiscription extends StatelessWidget {
  const HomeDiscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            child: Text(
              AppLocalizations.of(context)!.cafe_of_happines,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Text(
              AppLocalizations.of(context)!.cafetria,
            ),
          ),
          const Positioned(
            top: 5,
            right: 35,
            child: Image(
              image: AssetImage('images/coffee_logo.png'),
              width: 80,
              height: 80,
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
