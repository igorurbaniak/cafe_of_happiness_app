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
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Kontakt',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                    ListTile(
                      leading: const Icon(Icons.phone_in_talk_rounded),
                      title: const Text(
                        '555-666-777',
                        style: TextStyle(fontSize: 12),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.mail_sharp),
                      title: const Text(
                        'cafe.of.happiness@gmail.com',
                        style: TextStyle(fontSize: 12),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text(
                        'Drewnowska 58, 91-002 Łódź, Poland',
                        style: TextStyle(fontSize: 12),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.open_in_new),
                      splashColor: Colors.brown.shade500,
                    ),
                    ListTile(
                      leading: const Icon(Icons.facebook),
                      title: const Text(
                        'Facebook',
                        style: TextStyle(fontSize: 12),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.open_in_new),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 12),
                      ),
                      onTap: () {
                        context.read<RootCubit>().signOut();
                      },
                      trailing: const Icon(Icons.open_in_new),
                    ),
                  ],
                ).toList(),
              ),
            ),
            SwitchListTile(
              title: const Text(
                'Are you Vegetarian',
                style: TextStyle(fontSize: 12),
              ),
              secondary: const Icon(Icons.local_florist),
              activeTrackColor: Colors.brown,
              inactiveTrackColor: Colors.brown.shade200,
              value: false,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text(
                'Are you Vegan',
                style: TextStyle(fontSize: 12),
              ),
              secondary: const Icon(Icons.grass),
              activeTrackColor: Colors.brown,
              inactiveTrackColor: Colors.brown.shade200,
              value: false,
              onChanged: (value) {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
