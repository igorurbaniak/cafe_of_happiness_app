import 'package:cafe_of_happiness_app/domain/models/cafe_contacts_model/cafe_contacts_model.dart';
import 'package:flutter/material.dart';

final List<CafeContacts> contacts = [
  CafeContacts(
    contactInformation: 'Wi-Fi:',
    contactDetailInformation: "cafe.of.happiness",
    contactIcon: const Icon(Icons.wifi),
  ),
  CafeContacts(
    contactInformation: 'E-mail:',
    contactDetailInformation: "cafe.of.happiness@gmail.com",
    contactIcon: const Icon(Icons.email),
  ),
  CafeContacts(
    contactInformation: 'Address:',
    contactDetailInformation: "Drewnowska 58, 91-002 Łódź, Poland",
    contactIcon: const Icon(Icons.location_city),
  ),
  CafeContacts(
    contactInformation: 'Phone number:',
    contactDetailInformation: "1234567890",
    contactIcon: const Icon(Icons.phone),
  ),
  CafeContacts(
    contactInformation: 'Working hours:',
    contactDetailInformation: "08:00 - 19:00",
    contactIcon: const Icon(Icons.access_time_outlined),
  ),
];
