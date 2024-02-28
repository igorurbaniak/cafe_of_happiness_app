import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;
  bool _showObscureIcon = false;
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_onTextChanged);
  }

 void _onTextChanged() {
    setState(() {
      _showObscureIcon = passwordController.text.isNotEmpty;
    });
  }
  
  @override
  void dispose() {
    passwordController.dispose();
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
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: TextFormField(
            obscureText: _isObscure,
            controller: passwordController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            onChanged: (text) {
              setState(() {});
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Hasło',
              hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade500),
              suffixIcon: _showObscureIcon ? IconButton(
                icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey.shade500),
                onPressed: () {
                  setState(
                    () {
                      _isObscure = !_isObscure;
                    },
                  );
                },
              ): null,
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
              prefixIcon: const Icon(Icons.lock, size: 26),
            ),
          ),
        ),
      ],
    );
  }
}
