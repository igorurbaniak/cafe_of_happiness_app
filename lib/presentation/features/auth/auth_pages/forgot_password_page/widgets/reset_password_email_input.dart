import 'package:flutter/material.dart';

class ResetPasswordEmailInput extends StatefulWidget {
  const ResetPasswordEmailInput({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  State<ResetPasswordEmailInput> createState() =>
      _ResetPasswordEmailInputState();
}

class _ResetPasswordEmailInputState extends State<ResetPasswordEmailInput> {
  bool _showCloseIcon = false;

  @override
  void initState() {
    super.initState();
    widget.emailController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _showCloseIcon = widget.emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    widget.emailController.dispose();
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
        controller: widget.emailController,
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
                    widget.emailController.clear();
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
