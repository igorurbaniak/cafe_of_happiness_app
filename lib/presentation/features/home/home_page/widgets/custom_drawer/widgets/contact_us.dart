import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: ListTile.divideTiles(
        color: Colors.grey.shade300,
        context: context,
        tiles: [
          _buildContactItem(Icons.phone_in_talk_rounded, '555-666-777', () {}),
          _buildContactItem(Icons.mail_sharp, 'cafe.of.happiness@gmail.com', () {}),
          _buildContactItemWithTrailing(
            Icons.location_on,
            'Drewnowska 58, 91-002 Łódź, Poland',
            Icons.open_in_new,
            () {},
          ),
          _buildContactItemWithTrailing(
            Icons.facebook,
            'Facebook',
            Icons.open_in_new,
            () {},
          ),
        ],
      ).toList(),
    );
  }

  Widget _buildContactItem(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
      onTap: onTap,
    );
  }

  Widget _buildContactItemWithTrailing(
      IconData icon, String text, IconData trailingIcon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
      onTap: onTap,
      trailing: Icon(trailingIcon),
      splashColor: Colors.brown.shade500,
    );
  }
}