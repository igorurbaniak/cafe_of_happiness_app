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
      appBar: AppBar(
        title: const Text(
          'Welcome to Café of Happiness',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
        child: const Column(
          children: [
            CreateAccountHeader(),
            SizedBox(height: 20),
            CreateEmailInput(),
            SizedBox(height: 10),
            CreatePasswordInput(),
            SizedBox(height: 50),
            CreateAccountButton(),
            SizedBox(height: 70),
            HaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
