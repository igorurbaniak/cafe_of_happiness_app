import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
        border: Border.all(
          width: 1,
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                child: Image.asset('images/google_icon.png'),
              ),
              const SizedBox(width: 10),
              Text(
                'Sign in with Google',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
