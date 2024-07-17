import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/custom_drawer/widgets/contact_list.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/custom_drawer/widgets/logged_in_drawer.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/custom_drawer/widgets/logged_out_drawer.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/custom_drawer/widgets/section_title.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/custom_drawer/widgets/settings_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 60, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (user != null)
                LoggedInDrawer(user: user!)
              else
                const LoggedOutDrawer(),
              const SectionTitleDrawer(title: 'Contact us'),
              const ContactList(),
              const SizedBox(height: 50),
              const SectionTitleDrawer(title: 'Settings'),
              SettingsList(user: user),
            ],
          ),
        ),
      ),
    );
  }
}
