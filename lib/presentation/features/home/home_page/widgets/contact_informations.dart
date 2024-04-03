import 'package:cafe_of_happiness_app/data/data_sources/cafe_contacts_data/cafe_contacts_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactInformations extends StatelessWidget {
  ContactInformations({super.key});

  final Uri _urlCafeFacebook = Uri.parse('https://www.facebook.com/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_urlCafeFacebook)) {
      throw Exception('Could not launch $_urlCafeFacebook');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                onTap: () {},
                leading: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade100),
                    height: 40,
                    width: 40,
                    child: contacts[index].contactIcon),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      contacts[index].contactInformation,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      contacts[index].contactDetailInformation,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const Divider(
          color: Colors.black12,
          thickness: 1.5,
        ),
        const SizedBox(height: 15),
        Column(
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SelectableText(
                      AppLocalizations.of(context)!.drewnowska_street,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      AppLocalizations.of(context)!.we_in_social_media,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              widthFactor: 3.1,
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: _launchUrl,
                icon: const Icon(Icons.facebook),
                label: const Text(
                  'Facebook',
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        )
      ],
    );
  }
}
