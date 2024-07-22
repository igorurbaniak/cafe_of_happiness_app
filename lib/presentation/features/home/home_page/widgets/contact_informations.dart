import 'package:cafe_of_happiness_app/app/core/themes/dark_theme.dart';
import 'package:cafe_of_happiness_app/app/core/themes/theme_light.dart';
import 'package:cafe_of_happiness_app/data/data_sources/cafe_contacts_data/cafe_contacts_data.dart';
import 'package:cafe_of_happiness_app/domain/models/cafe_contacts_model/cafe_contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactInformations extends StatefulWidget {
  const ContactInformations({super.key});

  @override
  State<ContactInformations> createState() => _ContactInformationsState();
}

class _ContactInformationsState extends State<ContactInformations> {
  final Uri _urlCafeFacebook = Uri.parse('https://www.facebook.com/');

  Future<void> _launchUrl() async {
    String? errorMessage;
    try {
      if (!await launchUrl(_urlCafeFacebook)) {
        errorMessage = 'Could not launch $_urlCafeFacebook';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    }
    if (errorMessage != null) {
      _showErrorSnackbar(errorMessage);
    }
  }

  void _showErrorSnackbar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildContactsList(),
          const SizedBox(height: 10),
          Divider(
            color: isDarkMode
                ? ThemeDark.accentColorDark
                : ThemeLight.accentColorLight,
            thickness: 1.5,
          ),
          const SizedBox(height: 10),
          _buildContactDetails(context),
          Divider(
            color: isDarkMode
                ? ThemeDark.accentColorDark
                : ThemeLight.accentColorLight,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }

  Widget _buildContactsList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return _buildContactCard(contacts[index]);
      },
    );
  }

  Widget _buildContactCard(CafeContacts contact) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      child: ListTile(
        onTap: () {},
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey.shade100,
          ),
          height: 40,
          width: 40,
          child: contact.contactIcon,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              contact.contactInformation,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              contact.contactDetailInformation,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactDetails(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.contact_details,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SelectableText(
                  AppLocalizations.of(context)!.drewnowska_street,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 35),
                Text(
                  AppLocalizations.of(context)!.we_in_social_media,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Align(
          widthFactor: 3.1,
          alignment: Alignment.topLeft,
          child: TextButton.icon(
            onPressed: () => _launchUrl(),
            icon: const Icon(Icons.facebook),
            label:
                Text('Facebook', style: Theme.of(context).textTheme.titleSmall),
          ),
        ),
      ],
    );
  }
}
