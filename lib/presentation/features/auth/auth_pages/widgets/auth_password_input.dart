import 'package:flutter/material.dart';

class AuthPasswordInput extends StatefulWidget {
  const AuthPasswordInput({super.key, required this.onPasswordChanged});

  final Function(String?) onPasswordChanged;

  @override
  State<AuthPasswordInput> createState() => _AuthPasswordInputState();
}

class _AuthPasswordInputState extends State<AuthPasswordInput> {
  bool _isObscure = true;
  bool _showObscureIcon = false;
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onTextChanged);
    _passwordFocusNode.addListener(_onFocusChange);
  }

  void _onTextChanged() {
    setState(() {
      _showObscureIcon = _passwordController.text.isNotEmpty;
      _validatePassword(_passwordController.text);
    });
    widget.onPasswordChanged(_passwordController.text);
  }

  void _validatePassword(String password) {
    if (password.isEmpty) {
      _errorText = 'Password cannot be empty';
    } else if (password.length < 8) {
      _errorText = 'Password must be at least 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      _errorText = 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      _errorText = 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      _errorText = 'Password must contain at least one digit';
    } else if (!RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(password)) {
      _errorText = 'Password must contain at least one special character';
    } else if (password.length >= 24) {
      _errorText = 'Email address cannot exceed more characters';
    } else {
      _errorText = null;
    }
  }

  void _onFocusChange() {
    if (!_passwordFocusNode.hasFocus) {
      setState(() {
        _errorText = null;
      });
    } else {
      _validatePassword(_passwordController.text);
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void isObscureText() {
    setState(() {
      _isObscure = !_isObscure;
    });
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
            obscureText: _isObscure,
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            maxLength: 24,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondaryContainer,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.6,
            ),
            onChanged: widget.onPasswordChanged,
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: 'Hasło',
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondaryContainer),
              suffixIcon: _showObscureIcon
                  ? IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                      onPressed: isObscureText,
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
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