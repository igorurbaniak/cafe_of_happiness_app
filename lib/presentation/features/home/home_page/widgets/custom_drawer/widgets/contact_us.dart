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
            '555-666-777',
            () {},
          ),
          _buildContactItem(
            context,
            Icons.mail_sharp,
            'cafe.of.happiness@gmail.com',
            () {},
          ),
          _buildContactItemWithTrailing(
            context,
            Icons.location_on,
            'Drewnowska 58, 91-002 Łódź, Poland',
            Icons.open_in_new,
            () {},
          ),
          _buildContactItemWithTrailing(
            context,
            Icons.facebook,
            'Facebook',
            Icons.open_in_new,
            () {},
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
