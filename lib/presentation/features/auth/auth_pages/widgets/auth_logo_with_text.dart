import 'package:flutter/material.dart';

class AuthLogoWithText extends StatelessWidget {
  const AuthLogoWithText(
      {super.key,
      required this.authLogoText,
      required this.assetWidth,
      required this.assetHeight});

  final String authLogoText;
  final double assetWidth;
  final double assetHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/coffee_logo.png',
          width: assetWidth,
          height: assetHeight,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 30),
        Text(
          authLogoText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
