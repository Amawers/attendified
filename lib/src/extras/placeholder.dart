import 'dart:async';

import 'package:attendified/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Image.asset('assets/images/logo.png', width: 200),
              const Text(
                'Welcome',
                style: TextStyle(color: Colors.red),
              ),
              const Text(
                'hello log in',
                style: TextStyle(color: Colors.red),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: 587,
                    width: 375,
                    margin: const EdgeInsets.only(top: 68, bottom: 113),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 34,
                              width: 264,
                              margin: const EdgeInsets.only(
                                left: 15,
                                right: 16,
                              ),
                              child: const Text("Welcome to Supabase",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26))),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 28,
                              right: 16,
                            ),
                            child: Container(
                              width: 343,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                border: Border.all(
                                  color: Colors.blue.shade50,
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: "Enter your email",
                                    hintStyle: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.blueGrey.shade300),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      borderSide: const BorderSide(
                                          color: Colors.white70),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      borderSide: const BorderSide(
                                          color: Colors.white70),
                                    ),
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.all(
                                        15,
                                      ),
                                      child: Icon(Icons.email_outlined),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white),
                                style: TextStyle(
                                    color: Colors.blueGrey.shade300,
                                    fontSize: 14.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            width: 343,
                            height: 48,
                            margin: const EdgeInsets.only(
                              left: 16,
                              top: 8,
                              right: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              border: Border.all(
                                color: Colors.blue.shade50,
                                width: 1,
                              ),
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.blueGrey.shade300),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                    borderSide:
                                        const BorderSide(color: Colors.white70),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                    borderSide:
                                        const BorderSide(color: Colors.white70),
                                  ),
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(
                                      15,
                                    ),
                                    child: Icon(Icons.lock_outline_rounded),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white),
                              style: TextStyle(
                                  color: Colors.blueGrey.shade300,
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              onTapBtnSignUp(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                top: 18,
                                right: 16,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 57,
                                width: 343,
                                child: const Text(
                                  "Sign In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/signup');
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                top: 18,
                                right: 16,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 57,
                                width: 343,
                                child: const Text(
                                  "Sign Up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> onTapBtnSignUp(BuildContext context) async {
    try {
      final user = await Supabase.instance.client.auth.signInWithPassword(
          email: emailController.text, password: passwordController.text);

      if (user != null) {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/dashboard');
        }
      }
    } on AuthException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Invalid login credentialsasdadad.'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } catch (error) {
      print('Unexpected error occurred: $error');
    }
  }
}
