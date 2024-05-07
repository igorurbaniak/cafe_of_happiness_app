import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/contact_informations.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/custom_appbar.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/custom_drawer.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/home_discription.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/home_menu_category/home_menu_category.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/location_google_map/location_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(scaffoldKey: scaffoldKey),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeDiscription(),
            const HomeMenuCategory(),
            ContactInformations(),
            const LocationGoogleMap(),
          ],
        ),
      ),
    );
  }
}
