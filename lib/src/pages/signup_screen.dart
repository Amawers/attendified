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
           /*! Implement this to the account settings */
            // TextFormField(
            //     controller: firstNameController,
            //     decoration:
            //         const InputDecoration(hintText: "Enter First Name")),
            // TextFormField(
            //     controller: lastNameController,
            //     decoration: const InputDecoration(hintText: "Enter Last Name")),

            GestureDetector(
              onTap: () {
                onTapBtnSignUp();
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
            )
          ]),
    );
  }

  Future<void> onTapBtnSignUp() async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
        /*implement later in account settings*/
        // data: {
        //   'first_name': firstNameController.text,
        //   'last_name': lastNameController.text,
        // },
      );

      if (response != null) {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/dashboard');
        }
      }
    } on AuthException catch (error) {
      SnackBar(content: Text(error.message));
    } catch (error) {
      print(error);
    }
  }
}
