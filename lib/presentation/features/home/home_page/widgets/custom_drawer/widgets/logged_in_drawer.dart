import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedInDrawer extends StatelessWidget {
  const LoggedInDrawer({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUserCard(context, 'Welcome, ${user.email}!'),
        const SizedBox(height: 10),
        _buildInfoTile(
          'Apply to the buffet, give the expediter today\'s promo code and get your second coffee today free!',
        ),
        const SizedBox(height: 10),
        _buildInfoTile(
          'EURO2024',
          trailing: const Icon(Icons.sports_soccer),
          alignment: ListTileTitleAlignment.center,
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildUserCard(BuildContext context, String title) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const LoginPage()),
          );
        },
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey.shade100,
          ),
          height: 40,
          width: 40,
          child: const Icon(Icons.person),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, {Widget? trailing, ListTileTitleAlignment? alignment}) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
      titleAlignment: alignment ?? ListTileTitleAlignment.center,
      trailing: trailing,
    );
  }
}