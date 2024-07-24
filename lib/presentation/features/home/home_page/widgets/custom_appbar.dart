import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/login_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/pages/search_dish_page/search_dish_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/pages/select_language_page/select_language_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.scaffoldKey, required this.user});

  final User? user;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final systemLocale = Localizations.localeOf(context);
    final languageText =
        systemLocale.languageCode == 'pl' ? 'PL 🇵🇱' : 'EN 🇬🇧';

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      actions: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (user == null || user != null) const SizedBox(width: 20),
                _buildLanguageButton(
                  context,
                  languageText,
                ),
                const SizedBox(width: 5),
                if (user == null)
                  _buildIconButton(
                    context,
                    const Icon(Icons.person, size: 20),
                    const LoginPage(),
                  ),
                const SizedBox(width: 5),
                _buildIconButton(
                  context,
                  const Icon(Icons.search, size: 20),
                  const SearchDishPage(),
                ),
                const SizedBox(width: 30),
                _buildDrawerButton(context),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLanguageButton(BuildContext context, String languageText) {
    return SizedBox(
      height: 40,
      width: 90,
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  width: 0.8,
                  color: Theme.of(context).colorScheme.onTertiaryContainer),
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const SelectLanguagePage(),
            ),
          );
        },
        child: Wrap(
          children: [
            Text(
              languageText,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.arrow_drop_down,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, Icon icon, Widget page) {
    return SizedBox(
      height: 40,
      width: 45,
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  width: 0.8,
                  color: Theme.of(context).colorScheme.onTertiaryContainer),
            ),
          ),
        ),
        child: icon,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => page,
            ),
          );
        },
      ),
    );
  }

  Widget _buildDrawerButton(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 45,
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  width: 0.8,
                  color: Theme.of(context).colorScheme.onTertiaryContainer),
            ),
          ),
        ),
        child: const Icon(
          Icons.menu,
          size: 20,
        ),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.closeDrawer();
          } else {
            scaffoldKey.currentState!.openDrawer();
          }
        },
      ),
    );
  }
}
