import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.loginPressed});

  final VoidCallback loginPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.brown.shade500,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 60,
        child: TextButton(
          onPressed: () {
            loginPressed;
          },
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
