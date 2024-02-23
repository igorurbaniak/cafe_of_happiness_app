import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
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
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            onChanged: (email) {},
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Twój adres e-mail',
              hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade500),
              suffixIcon: _showCloseIcon ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {
                  widget.emailController.clear();
                },
              ) : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
              prefixIcon: const Icon(Icons.email, size: 26),
            ),
          ),
        ),
      ],
    );
  }
}
