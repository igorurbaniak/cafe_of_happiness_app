import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:flutter/material.dart';

class SelectLanguagePage extends StatelessWidget {
  const SelectLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final systemLocale = Localizations.localeOf(context);
    final languageText =
        systemLocale.languageCode == 'pl' ? 'Polski   🇵🇱' : 'English   🇬🇧';

    return Scaffold(
      appBar: BackAppBar(title: languageText),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Important!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If you need to change the language of the application. Please go to your mobile phone settings and change the language of the app according to your needs. \n\nThank you and welcome in \nCafe of Happines ❤️',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
