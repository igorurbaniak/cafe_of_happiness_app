import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade300, // Light-up effect
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            onChanged: (email) {},
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Twój adres e-mail',
              hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade500),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {
                  emailController.clear();
                },
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Icon(
                  Icons.email,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
