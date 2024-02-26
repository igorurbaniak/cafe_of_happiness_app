import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/forgot_password_page/forgot_password_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/login_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/password_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nickController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var errorMessage = '';
    var isCreatingAccount = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Zaloguj się'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'images/coffee_logo.png',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 35),
              Text(
                isCreatingAccount == true ? 'Sign up' : 'Sign in',
                style: const TextStyle(
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
                        EmailInput(emailController: emailController),
                        const SizedBox(height: 10),
                        PasswordInput(passwordController: passwordController),
                        if (isCreatingAccount == false) ...[
                          TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.brown.shade500),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const ForgotPassword()),
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
                              child: Text(
                                isCreatingAccount == true ? 'Sign up' : 'Login',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        if (isCreatingAccount == false) ...[
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
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                        const SizedBox(
                          height: 40,
                        ),
                        if (isCreatingAccount == false) ...[
                          TextButton.icon(
                            icon: const Icon(Icons.create),
                            label: const Text('Create New Account'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.grey.shade700,
                            ),
                            onPressed: () {
                              setState(() {
                                isCreatingAccount = true;
                              });
                            },
                          ),
                        ],
                        if (isCreatingAccount == true) ...[
                          Column(
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      isCreatingAccount = false;
                                    },
                                  );
                                },
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //       ],
    //     ),
    //   ),
    // );
  }
}
