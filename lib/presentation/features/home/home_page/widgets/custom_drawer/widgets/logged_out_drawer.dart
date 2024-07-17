import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

class LoggedOutDrawer extends StatelessWidget {
  const LoggedOutDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUserCard(context),
        const SizedBox(height: 10),
        _buildInfoTile(
          'Login to simplify the ordering process and use additional features.',
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildUserCard(BuildContext context) {
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
        title: const Text(
          'Sign in',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(
          Icons.arrow_right_sharp,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}