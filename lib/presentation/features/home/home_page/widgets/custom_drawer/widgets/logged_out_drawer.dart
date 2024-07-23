import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

class LoggedOutDrawer extends StatelessWidget {
  const LoggedOutDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          color: Theme.of(context).colorScheme.onTertiary,
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
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              height: 40,
              width: 40,
              child: const Icon(Icons.person),
            ),
            title: Text(
              'Sign in',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: const Icon(
              Icons.arrow_right_sharp,
              size: 30,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
          tileColor: Theme.of(context).colorScheme.onTertiary,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(
            'Login to simplify the ordering process and use additional features.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
