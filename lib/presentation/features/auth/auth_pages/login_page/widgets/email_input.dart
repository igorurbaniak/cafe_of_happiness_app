import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({super.key, required this.onEmailChanged});

  final Function(String?) onEmailChanged;

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  bool _showCloseIcon = false;
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _showCloseIcon = _emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondaryContainer,
              width: 1,
            ),
          ),
          child: TextFormField(
            cursorColor: Theme.of(context).colorScheme.secondaryContainer,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondaryContainer,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
            onChanged: widget.onEmailChanged,
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
                        _emailController.clear();
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
        ),
      ],
    );
  }
}
