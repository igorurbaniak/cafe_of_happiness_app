import 'package:flutter/material.dart';

class AuthEmailInput extends StatefulWidget {
  const AuthEmailInput({
    super.key,
    required this.onEmailChanged,
  });

  final Function(String?) onEmailChanged;

  @override
  State<AuthEmailInput> createState() => _AuthEmailInputState();
}

class _AuthEmailInputState extends State<AuthEmailInput> {
  bool _showCloseIcon = false;
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onTextChanged);
    _emailFocusNode.addListener(_onFocusChange);
  }

  void _validateEmail(String email) {
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (email.isEmpty) {
      _errorText = 'Email address cannot be empty';
    } else if (email.length < 6) {
      _errorText = 'Email address must have at least 6 characters';
    } else if (email.length >= 24) {
      _errorText = 'Email address cannot exceed more characters';
    } else if (!RegExp(emailRegex).hasMatch(email)) {
      _errorText = 'Please enter a valid email address';
    } else {
      _errorText = null;
    }
  }

  void _onTextChanged() {
    setState(() {
      _showCloseIcon = _emailController.text.isNotEmpty;
      _validateEmail(_emailController.text);
    });
    widget.onEmailChanged(_emailController.text);
  }

  void _onFocusChange() {
    if (!_emailFocusNode.hasFocus) {
      setState(() {
        _errorText = null;
      });
    } else {
      _validateEmail(_emailController.text);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
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
              color: _errorText == null
                  ? Theme.of(context).colorScheme.secondaryContainer
                  : Theme.of(context).colorScheme.error,
              width: 1,
            ),
          ),
          child: TextFormField(
            cursorColor: Theme.of(context).colorScheme.secondaryContainer,
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            maxLength: 24,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondaryContainer,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.6,
            ),
            onChanged: widget.onEmailChanged,
            decoration: InputDecoration(
              counterText: '',
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
              prefixIcon: Icon(Icons.email,
                  color: Theme.of(context).colorScheme.secondaryContainer),
            ),
          ),
        ),
        if (_errorText != null)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                _errorText!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                ),
              ),
            ),
          ),
      ],
    );
  }
}