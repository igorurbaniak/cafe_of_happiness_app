import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonColor,
  });

  final VoidCallback? onPressed;
  final String buttonText;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 55,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
      ),
    );
  }
}
