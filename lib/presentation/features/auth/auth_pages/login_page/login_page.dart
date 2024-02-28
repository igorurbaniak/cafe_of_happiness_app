import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/create_user_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/forgot_password_page/forgot_password_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/google_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/email_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/password_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(
            'images/coffee_logo.png',
            width: 135,
            height: 135,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Text(
            'Sign in',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const EmailInput(),
                    const SizedBox(height: 10),
                    const PasswordInput(),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.brown.shade500),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const ForgotPassword()),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot your Password?',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.brown.shade500,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        height: 60,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black12,
                            thickness: 1.5,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Or sign in with',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Divider(
                            color: Colors.black12,
                            thickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const GoogleButton(),
                    const SizedBox(height: 40),
                    TextButton.icon(
                      icon: const Icon(Icons.create),
                      label: const Text('Create New Account'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey.shade700,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const CreateUserPage(),
                          ),
                        );
                      },
                    ),
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
