

import 'package:cafe_of_happiness_app/app/utils/copy_to_clipboard_utils.dart';
import 'package:cafe_of_happiness_app/app/utils/url_launcher_utils.dart';
import 'package:cafe_of_happiness_app/domain/models/cafe_contacts_model/cafe_contacts_model.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<CafeContacts> contacts;

  const ContactList({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return _buildContactCard(context, contacts[index]);
      },
    );
  }

  Widget _buildContactCard(BuildContext context, CafeContacts contact) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      child: ListTile(
        onTap: () => _handleContactTap(context, contact),
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
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

  void _handleContactTap(BuildContext context, CafeContacts contact) {
    switch (contact.contactInformation) {
      case 'Wi-Fi:':
      case 'E-mail:':
      case 'Address:':
      case 'Working hours:':
        CopyToClipboardUtils.copyToClipboard(context, contact.contactDetailInformation);
        break;
      case 'Phone number:':
        final url = Uri(scheme: 'tel', path: contact.contactDetailInformation);
        URLLauncherUtils .launchUrls(context, url);
        break;
    }
  }
}