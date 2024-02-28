import 'package:flutter/material.dart';

class ResetPasswordEmailInput extends StatefulWidget {
  const ResetPasswordEmailInput({super.key});

  @override
  State<ResetPasswordEmailInput> createState() =>
      _ResetPasswordEmailInputState();
}

class _ResetPasswordEmailInputState extends State<ResetPasswordEmailInput> {
  final emailController = TextEditingController();
  bool _showCloseIcon = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _showCloseIcon = emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          suffixIcon: _showCloseIcon
              ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    emailController.clear();
                  },
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Icon(Icons.email, size: 26),
          ),
          border: InputBorder.none,
          hintText: 'Twój adres e-mail',
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
