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
        const Divider(
          color: Colors.black12,
          thickness: 1.5,
        ),
        const SizedBox(height: 15),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact details',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Drewnowska Street 58 \nŁódź, Poland \n\n+48 666777888 \n\ncafe.of.happiness@gmail.com'),
                    SizedBox(height: 25),
                    Text('We in social networks',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Align(
              widthFactor: 3.1,
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
                label: const Text(
                  'Facebook',
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        )
      ],
    );
  }
}
