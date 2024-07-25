import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.loginPressed});

  final Function()? loginPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 55,
        child: TextButton(
          onPressed: loginPressed,
          child: Text(
            'Login',
            style: TextStyle(
                fontSize: 20, color: Theme.of(context).colorScheme.onTertiary),
          ),
        ),
      ),
    );
  }
}
