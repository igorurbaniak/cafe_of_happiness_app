import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedInDrawer extends StatelessWidget {
  const LoggedInDrawer({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUserCard(context, 'Welcome Tomek! 😊'),
        const SizedBox(height: 10),
        _buildInfoTile(
          context,
          'Apply to the buffet, give the expediter today\'s promo code and get your second coffee for free!',
        ),
        const SizedBox(height: 10),
        _buildInfoTile(
          context,
          'EURO2024',
          trailing: Icon(
            Icons.sports_soccer,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildUserCard(BuildContext context, String title) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Theme.of(context).colorScheme.onTertiary,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          height: 40,
          width: 40,
          child: Icon(Icons.person, color: Colors.grey.shade400),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  Widget _buildInfoTile(BuildContext context, String title,
      {Widget? trailing}) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      trailing: trailing,
    );
  }
}
