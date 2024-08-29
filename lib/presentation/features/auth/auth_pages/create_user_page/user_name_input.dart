import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final _nameFocusNode = FocusNode();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onTextChanged);
    _nameFocusNode.addListener(_onFocusChange);
  }

  void _onTextChanged() {
    setState(() {
      _showCloseIcon = _nameController.text.isNotEmpty;
      _validateName(_nameController.text);
    });
    widget.onNameChanged(_nameController.text);
  }

  void _validateName(String name) {
    if (name.isEmpty) {
      _errorText = 'Name cannot be empty';
    } else if (name.length < 3) {
      _errorText = 'Name must be longer than 2 characters';
    } else if (name.length > 16) {
      _errorText = 'Name must be at most 16 characters';
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
      _errorText = 'Name can only contain letters';
    } else if (name.length >= 20) {
      _errorText = 'Name cannot exceed more characters';
    } else {
      _errorText = null;
    }
  }

  void _onFocusChange() {
    if (!_nameFocusNode.hasFocus) {
      setState(() {
        _errorText = null;
      });
    } else {
      _validateName(_nameController.text);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocusNode.dispose();
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
            focusNode: _nameFocusNode,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'^[a-zA-Z]+$'),
              ),
            ],
            maxLength: 16,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondaryContainer,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.6,
            ),
            onChanged: widget.onNameChanged,
            decoration: InputDecoration(
              counterText: '',
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
              prefixIcon: Icon(Icons.person,
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