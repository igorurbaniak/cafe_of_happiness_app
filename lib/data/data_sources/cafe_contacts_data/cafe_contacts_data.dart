import 'package:cafe_of_happiness_app/domain/models/cafe_contacts_model/cafe_contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<CafeContacts> getContacts(BuildContext context) {
  return [
    CafeContacts(
      contactInformation: AppLocalizations.of(context)!.wifi,
      contactDetailInformation: "cafe.of.happiness",
      contactIcon: const Icon(Icons.wifi),
    ),
    CafeContacts(
      contactInformation: AppLocalizations.of(context)!.email,
      contactDetailInformation: "cafe.of.happiness@gmail.com",
      contactIcon: const Icon(Icons.email),
    ),
    CafeContacts(
      contactInformation: AppLocalizations.of(context)!.address,
      contactDetailInformation: AppLocalizations.of(context)!.drewnowska,
      contactIcon: const Icon(Icons.location_city),
    ),
    CafeContacts(
      contactInformation: AppLocalizations.of(context)!.phone_number,
      contactDetailInformation: "1234567890",
      contactIcon: const Icon(Icons.phone),
    ),
    CafeContacts(
      contactInformation: AppLocalizations.of(context)!.working_hours,
      contactDetailInformation: "08:00 - 19:00",
      contactIcon: const Icon(Icons.access_time_outlined),
    ),
  ];
}
