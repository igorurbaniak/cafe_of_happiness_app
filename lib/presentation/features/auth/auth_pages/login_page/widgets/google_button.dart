import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(backgroundColor: Colors.white),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40),
              ),
              SizedBox(
                height: 30,
                child: Image.asset('images/google_icon.png'),
              ),
              const SizedBox(width: 15),
              Text(
                'Sign in with Google',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
