import 'package:cafe_of_happiness_app/app/core/themes/cubit/theme_cubit.dart';
import 'package:cafe_of_happiness_app/app/root_page/cubit/root_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: ListTile.divideTiles(
        color: Colors.grey.shade300,
        context: context,
        tiles: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return _buildSettingsItem(
                  context,
                  Icons.dark_mode,
                  'Dark mode',
                  state.themeData.brightness == Brightness.dark
                      ? Icons.toggle_on
                      : Icons.toggle_off, () {
                context.read<ThemeCubit>().toggleTheme();
              });
            },
          ),
          if (user != null)
            _buildSettingsItem(
                context, Icons.logout, 'Logout', Icons.open_in_new, () {
              context.read<RootCubit>().signOut();
            }),
        ],
      ).toList(),
    );
  }

  Widget _buildSettingsItem(BuildContext context, IconData icon, String text,
      IconData trailingIcon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
      onTap: onTap,
      trailing: Icon(trailingIcon),
    );
  }
}