import 'package:cafe_of_happiness_app/app/utils/copy_to_clipboard_utils.dart';
import 'package:cafe_of_happiness_app/app/utils/url_launcher_utils.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          _buildContactItem(
            context,
            Icons.phone_in_talk_rounded,
            '1234567890',
            () => URLLauncherUtils.launchUrls(
                context, Uri(scheme: 'tel', path: '1234567890')),
          ),
          _buildContactItem(
            context,
            Icons.mail_sharp,
            'cafe.of.happiness@gmail.com',
            () => CopyToClipboardUtils.copyToClipboard(
                context, 'cafe.of.happiness@gmail.com'),
          ),
          _buildContactItemWithTrailing(
            context,
            Icons.location_on,
            'Drewnowska 58, 91-002 Łódź, Poland',
            Icons.open_in_new,
            () {
              final Uri mapUrl = Uri.parse(
                  'https://www.google.pl/maps/place/Manufaktura/@51.7792348,19.4423599,17z/data=!3m1!4b1!4m6!3m5!1s0x471bcb56c4119b59:0xfca7f17fec34f65b!8m2!3d51.7792315!4d19.4449348!16s%2Fm%2F0vxgttm?entry=ttu');
              URLLauncherUtils.launchUrls(context, mapUrl);
            },
          ),
          _buildContactItemWithTrailing(
            context,
            Icons.facebook,
            'Facebook',
            Icons.open_in_new,
            () => URLLauncherUtils.launchUrls(
                context, Uri.parse('https://www.facebook.com/')),
          ),
        ],
      ).toList(),
    );
  }

  Widget _buildContactItem(
      BuildContext context, IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: Theme.of(context).iconTheme.size,
      ),
      title: Text(text, style: Theme.of(context).textTheme.headlineSmall),
      onTap: onTap,
    );
  }

  Widget _buildContactItemWithTrailing(BuildContext context, IconData icon,
      String text, IconData trailingIcon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: Theme.of(context).iconTheme.size,
      ),
      title: Text(text, style: Theme.of(context).textTheme.headlineSmall),
      trailing: Icon(
        trailingIcon,
        color: Theme.of(context).iconTheme.color,
        size: Theme.of(context).iconTheme.size,
      ),
      onTap: onTap,
    );
  }
}
