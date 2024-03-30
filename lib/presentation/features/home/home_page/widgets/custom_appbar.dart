import 'package:cafe_of_happiness_app/data/data_sources/dishes_data_source/dishes_data_source.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/login_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/pages/search_dish_page/search_dish_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/pages/select_language_page/select_language_page.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
  });

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
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                SizedBox(
                  height: 40,
                  width: 90,
                  child: TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
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
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 40,
                  width: 45,
                  child: TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 40,
                  width: 45,
                  child: TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.search,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => SearchDishPage(dishes),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                SizedBox(
                  height: 40,
                  width: 45,
                  child: TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
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
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
