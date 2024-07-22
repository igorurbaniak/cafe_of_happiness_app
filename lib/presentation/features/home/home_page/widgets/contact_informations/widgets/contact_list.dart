import 'package:cafe_of_happiness_app/domain/models/cafe_contacts_model/cafe_contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _handleContactTap(BuildContext context, CafeContacts contact) {
    switch (contact.contactInformation) {
      case 'Wi-Fi:':
      case 'E-mail:':
      case 'Address:':
      case 'Working hours:':
        _copyToClipboard(contact.contactDetailInformation, context);
        break;
      case 'Phone number:':
        final url = Uri(scheme: 'tel', path: contact.contactDetailInformation);
        _launchUrl(url, context);
        break;
    }
  }

  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text)).then(
      (_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Copied to your clipboard!'),
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(Uri url, BuildContext context) async {
    final canLaunch = await canLaunchUrl(url);
    if (!context.mounted) return;
    if (canLaunch) {
      await launchUrl(url);
    } else {
      _showSnackBar(context, 'Could not launch URL');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }
}
