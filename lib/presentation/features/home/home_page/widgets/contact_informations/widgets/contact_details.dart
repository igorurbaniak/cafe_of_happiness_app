import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  Widget buildSocialButton(
      BuildContext context, String label, IconData icon, String url) {
    return TextButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.only(left: 0),
        ),
      ),
      onPressed: () => _launchUrl(context, Uri.parse(url)),
      icon: FaIcon(icon, size: 22),
      label: Text(
        label,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.we_in_social_media,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                buildSocialButton(context, 'Facebook', Icons.facebook,
                    'https://www.facebook.com/'),
                buildSocialButton(context, 'Instagram',
                    FontAwesomeIcons.instagram, 'https://www.instagram.com/'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
