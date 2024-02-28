import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/create_account_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/create_account_header.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/have_account_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/create_email_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/create_password_input.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const CreateAccountHeader(),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: const Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CreateEmailInput(),
                    SizedBox(height: 10),
                    CreatePasswordInput(),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 25),
                    CreateAccountButton(),
                    SizedBox(height: 20),
                    HaveAccountButton(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
