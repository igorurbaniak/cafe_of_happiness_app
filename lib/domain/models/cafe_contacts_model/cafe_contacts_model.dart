import 'package:flutter/material.dart';

class CafeContacts {
  CafeContacts({
    required this.contactInformation,
    required this.contactDetailInformation,
    required this.contactIcon,
  });
  final String contactInformation;
  final String contactDetailInformation;
  final Icon contactIcon;
}