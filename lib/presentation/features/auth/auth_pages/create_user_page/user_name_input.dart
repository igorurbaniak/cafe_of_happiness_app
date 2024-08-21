import 'package:flutter/material.dart';

class UserNameInput extends StatefulWidget {
  const UserNameInput({
    super.key,
    required this.onNameChanged,
  });

  final Function(String?) onNameChanged;

  @override
  State<UserNameInput> createState() => _UserNameInputState();
}

class _UserNameInputState extends State<UserNameInput> {
  bool _showCloseIcon = false;
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _showCloseIcon = _nameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
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
            controller: _nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondaryContainer,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.6,
            ),
            onChanged: widget.onNameChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Wpisz swoje imię',
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
                        _nameController.clear();
                      },
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
              prefixIcon: Icon(Icons.person, color: Theme.of(context).colorScheme.secondaryContainer),
            ),
          ),
        ),
      ],
    );
  }
}