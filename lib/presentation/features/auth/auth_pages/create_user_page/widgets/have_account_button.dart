import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

class HaveAccountButton extends StatelessWidget {
  const HaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const LoginPage(),
              ),
            );
          },
          child: const Text(
            'Sign in',
            style: TextStyle(color: Colors.brown, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
