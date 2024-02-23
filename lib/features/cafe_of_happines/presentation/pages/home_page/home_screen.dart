import 'package:cafe_of_happiness_app/features/cafe_of_happines/presentation/widgets/home_widgets/contact_informations.dart';
import 'package:cafe_of_happiness_app/features/cafe_of_happines/presentation/widgets/home_widgets/custom_appbar.dart';
import 'package:cafe_of_happiness_app/features/cafe_of_happines/presentation/widgets/home_widgets/custom_drawer.dart';
import 'package:cafe_of_happiness_app/features/cafe_of_happines/presentation/widgets/home_widgets/home_discription.dart';
import 'package:cafe_of_happiness_app/features/cafe_of_happines/presentation/widgets/home_widgets/home_menu_list.dart';
import 'package:cafe_of_happiness_app/features/cafe_of_happines/presentation/widgets/home_widgets/location_input.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HomeDiscription(),
            HomeMenuList(),
            ContactInformations(),
            LocationInformation(),
          ],
        ),
      ),
    );
  }
}
