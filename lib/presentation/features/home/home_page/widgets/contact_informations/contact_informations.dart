import 'package:cafe_of_happiness_app/data/data_sources/cafe_contacts_data/cafe_contacts_data.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/contact_informations/widgets/contact_details.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/contact_informations/widgets/contact_list.dart';
import 'package:flutter/material.dart';

class ContactInformations extends StatelessWidget {
  const ContactInformations({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = getContacts(context);
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const SizedBox(height: 10),
          ContactList(contacts: contacts),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          const ContactDetails(),
          const Divider(),
        ],
      ),
    );
  }
}
