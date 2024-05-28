import 'package:cafe_of_happiness_app/app/root_page/cubit/root_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: SafeArea(
        minimum: const EdgeInsets.only(top: 60, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const LoginPage(),
                    ),
                  );
                },
                leading: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.shade100),
                  height: 40,
                  width: 40,
                  child: const Icon(Icons.person),
                ),
                title: const Text(
                  'Zaloguj się',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  Icons.arrow_right_sharp,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              title: const Text(
                'Zaloguj sie aby uprościć proces zamawiania i korzystać z dodatkowych funkcji.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Kontakt',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: ListTile.divideTiles(
                  color: Colors.grey.shade300,
                  context: context,
                  tiles: [
                    _buildContactItem(
                      Icons.phone_in_talk_rounded,
                      '555-666-777',
                      () {},
                    ),
                    _buildContactItem(
                      Icons.mail_sharp,
                      'cafe.of.happiness@gmail.com',
                      () {},
                    ),
                    _buildContactItemWithTrailing(
                      Icons.location_on,
                      'Drewnowska 58, 91-002 Łódź, Poland',
                      Icons.open_in_new,
                      () {},
                    ),
                    _buildContactItemWithTrailing(
                      Icons.facebook,
                      'Facebook',
                      Icons.open_in_new,
                      () {},
                    ),
                    _buildContactItemWithTrailing(
                      Icons.logout,
                      'Logout',
                      Icons.open_in_new,
                      () {
                        context.read<RootCubit>().signOut();
                      },
                    ),
                  ],
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
      onTap: onTap,
    );
  }

  Widget _buildContactItemWithTrailing(
      IconData icon, String text, IconData trailingIcon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
      onTap: onTap,
      trailing: Icon(trailingIcon),
      splashColor: Colors.brown.shade500,
    );
  }
}