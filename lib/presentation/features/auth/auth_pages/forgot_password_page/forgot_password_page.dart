import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  bool _showCloseIcon = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _showCloseIcon = emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset your password'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Image.asset(
                    'images/coffee_logo.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    'Receive an eamil adress to\n reset your password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      suffixIcon: _showCloseIcon
                                          ? IconButton(
                                              icon: const Icon(
                                                Icons.clear,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                emailController.clear();
                                              },
                                            )
                                          : null,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      prefixIcon: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Icon(Icons.email, size: 26),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Twój adres e-mail',
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
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
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    'Reset Password',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
