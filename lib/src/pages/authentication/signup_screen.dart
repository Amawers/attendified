import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Supabase",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            TextFormField(
                controller: emailController,
                decoration:
                    const InputDecoration(hintText: "Enter your email")),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: "Enter Password")),
            TextFormField(
                controller: firstNameController,
                decoration:
                    const InputDecoration(hintText: "Enter First Name")),
            TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(hintText: "Enter Last Name")),
            TextFormField(
                controller: phoneNumberController,
                decoration:
                    const InputDecoration(hintText: "Enter Phone Number")),
            TextFormField(
                controller: departmentController,
                decoration:
                    const InputDecoration(hintText: "Enter Department")),
            GestureDetector(
              onTap: () {
                onTapBtnSignUp();
                              print('tuplok na');

              },
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
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text.rich(TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 193, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: " Sign In",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 193, 29),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ])),
                      ),
                    ),
          ]),
    );
  }

  Future<void> onTapBtnSignUp() async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
        /*implement later in account settings*/
        data: {
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'phone_number': phoneNumberController.text,
          'department': departmentController.text
        },
      );
              print('Done');


      if (response != null) {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/');
        }
      }
    } on AuthException catch (error) {
      SnackBar(content: Text(error.message));
    } catch (error) {
      print(error);
    }
  }
}
