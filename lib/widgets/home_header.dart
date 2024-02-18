import 'package:cafe_of_happiness_app/widgets/contact_informations.dart';
import 'package:cafe_of_happiness_app/widgets/home_discription.dart';
import 'package:cafe_of_happiness_app/widgets/home_menu_list.dart';
import 'package:cafe_of_happiness_app/widgets/location_input.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Colors.white,
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 40, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                child: ListTile(
                  onTap: () {},
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
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: ListTile.divideTiles(
                    color: Colors.grey.shade300,
                    context: context,
                    tiles: [
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
                        leading: const Icon(Icons.facebook),
                        title: const Text(
                          'Facebook',
                          style: TextStyle(fontSize: 12),
                        ),
                        onTap: () {},
                        trailing: const Icon(Icons.open_in_new),
                      ),
                    ],
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 40,
                    width: 90,
                    child: TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Wrap(
                        children: [
                          Text(
                            'EN',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_drop_down, size: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: 45,
                    child: TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    width: 45,
                    child: TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 30),
                  SizedBox(
                    height: 40,
                    width: 45,
                    child: TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.menu,
                        size: 20,
                      ),
                      onPressed: () {
                        if (scaffoldKey.currentState!.isDrawerOpen) {
                          scaffoldKey.currentState!.closeDrawer();
                          //close drawer, if drawer is open
                        } else {
                          scaffoldKey.currentState!.openDrawer();
                          //open drawer, if drawer is closed
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ],
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
