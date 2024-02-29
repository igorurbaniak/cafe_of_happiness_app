import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/create_user_page.dart';
import 'package:flutter/material.dart';

class CreateNewAccountButton extends StatelessWidget {
  const CreateNewAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.create),
      label: const Text('Create New Account'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey.shade700,
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const CreateUserPage(),
          ),
        );
      },
    );
  }
}
