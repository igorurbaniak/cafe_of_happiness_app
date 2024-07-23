import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({super.key});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  Future<void> _launchUrl(BuildContext context, Uri url) async {
    final canLaunch = await canLaunchUrl(url);
    if (!mounted) return;
    if (canLaunch) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          content: Text(
            'Couldn\'t launch URL, try again later',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => _launchUrl(
              context,
              Uri.parse('https://www.facebook.com/'),
            ),
            icon: const Icon(Icons.facebook),
            label: Text(
              'Facebook',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ],
    );
  }
}
