import 'package:flutter/material.dart';

class CreateEmailInput extends StatefulWidget {
  const CreateEmailInput({
    super.key,
    required this.onEmailChanged,
    required this.emailController,
    required this.showCloseIcon,
  });

  final Function(String?) onEmailChanged;
  final TextEditingController emailController;
  final bool showCloseIcon;

  @override
  State<CreateEmailInput> createState() => _CreateEmailInputState();
}

class _CreateEmailInputState extends State<CreateEmailInput> {
  // bool _showCloseIcon = false;

  // @override
  // void initState() {
  //   super.initState();
  //   widget.emailController.addListener(_onTextChanged);
  // }

  // void _onTextChanged() {
  //   setState(() {
  //     _showCloseIcon = widget.emailController.text.isNotEmpty;
  //   });
  // }

  // @override
  // void dispose() {
  //   widget.emailController.dispose();
  //   super.dispose();
  // }

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
            onChanged: widget.onEmailChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Twój adres e-mail',
              hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade500),
              suffixIcon: widget.showCloseIcon
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.grey.shade500,
                      ),
                      onPressed: () {
                        widget.emailController.clear();
                      },
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
              prefixIcon: const Icon(Icons.email, size: 26),
            ),
          ),
        ),
      ],
    );
  }
}
