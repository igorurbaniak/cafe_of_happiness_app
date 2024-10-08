import 'package:cafe_of_happiness_app/app/core/themes/cubit/theme_cubit.dart';
import 'package:cafe_of_happiness_app/app/core/themes/cubit/theme_state.dart';
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
      children: ListTile.divideTiles(
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
                    : Icons.toggle_off,
                () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
          if (user != null)
            _buildSettingsItem(
              context,
              Icons.logout,
              'Logout',
              null,
              () {
                context.read<RootCubit>().signOut();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'You have been logged out!',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              },
            ),
        ],
      ).toList(),
    );
  }

  Widget _buildSettingsItem(BuildContext context, IconData icon, String text,
      IconData? trailingIcon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).iconTheme.color),
      title: Text(text, style: Theme.of(context).textTheme.headlineSmall),
      trailing: trailingIcon != null
          ? Icon(trailingIcon, color: Theme.of(context).iconTheme.color)
          : null,
      onTap: onTap,
    );
  }
}
