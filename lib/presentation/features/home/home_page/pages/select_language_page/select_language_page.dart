import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:flutter/material.dart';

class SelectLanguagePage extends StatelessWidget {
  const SelectLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final systemLocale = Localizations.localeOf(context);
    final languageText =
        systemLocale.languageCode == 'pl' ? 'Polski  🇵🇱' : 'English  🇬🇧';

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: BackAppBar(title: languageText),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Important!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'If you need to change the language of the application. Please go to your mobile phone settings and change the language of the app according to your needs. \n\nThank you and welcome in \nCafe of Happines ❤️',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
