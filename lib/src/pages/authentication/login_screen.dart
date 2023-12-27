import 'dart:async';
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
              Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.red),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, color: Color(0xff081631)),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Color(0xffD3D3D3)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.red),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Color(0xff081631)),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Color(0xffD3D3D3)),
                        suffixIcon: IconButton(
                          onPressed: null,
                          icon:
                              Icon(Icons.visibility, color: Color(0xff081631)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 193, 0, 0),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            onTapSignUp(context);
                          },
                          child: const Text('Log In',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ))),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: const Text.rich(TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 193, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: " Sign up",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 193, 29),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ])),
                      ),
                    ),
                  ],
                ),
              ))
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> onTapSignUp(BuildContext context) async {
    try {
      final user = await Supabase.instance.client.auth.signInWithPassword(
          email: emailController.text, password: passwordController.text);

      if (user != null) {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/bottom_navbar');
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
