import 'package:cafe_of_happiness_app/data/cafeteria_contacts.dart';
import 'package:flutter/material.dart';

class ContactInformations extends StatelessWidget {
  const ContactInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                child: ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey.shade100),
                      height: 45,
                      width: 45,
                      child: contacts[index].contactIcon),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        contacts[index].contactInformation,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        contacts[index].contactDetailInformation,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
