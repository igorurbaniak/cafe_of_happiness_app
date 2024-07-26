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
          color: Theme.of(context).colorScheme.secondaryContainer,
          width: 1,
        ),
      ),
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.secondaryContainer,
        controller: widget.emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.secondaryContainer,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.6,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Twój adres e-mail',
          hintStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.secondaryContainer),
          suffixIcon: _showCloseIcon
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  onPressed: () {
                    widget.emailController.clear();
                  },
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          prefixIcon: Icon(
            Icons.email,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
      ),
    );
  }
}
