import 'dart:convert';

import 'package:attendified/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}


///goldilokcs?

class _DashboardScreenState extends State<DashboardScreen> {
  final User? user = supabase.auth.currentUser;

  TextEditingController subjectNameController = TextEditingController();

  Map<String, dynamic> converted = {};

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await getTeacherDetails();
    });
  }

  Future<void> getTeacherDetails() async {
    try {
      String? userId = user?.id;

      final response = await supabase
          .from('teachers')
          .select()
          .eq('teacher_id', userId)
          .single();

      print('THE RUN TIME TYPE IS: ${response.runtimeType}');

      setState(() {
        converted = response;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: ListView(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff101010),
                  blurRadius: 2,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        'Morning, ${converted['first_name']}',
                        style: const TextStyle(
                          color: Color(0xff081631),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        'Monday, 9 Nov 2023',
                        style: const TextStyle(
                          color: Color(0xff081631),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.only(left: 12, right: 12),
                //   width: 50,
                //   height: 50,
                //   child: ClipOval(
                //     child: Image.asset(
                //       'assets/images/person.jpg',
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          TextFormField(
            controller: subjectNameController,
            decoration: const InputDecoration(hintText: "Enter your subject"),
          ),
          ElevatedButton(
            onPressed: () {
              createSubject();
            },
            child: const Text('Enter subject'),
          ),
        ],
      ),
    );
  }

  Future<void> createSubject() async {
    try {
      await supabase
          .from('subjects')
          .insert({'subject_name': subjectNameController.text});
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message),
      ));
    } catch (error) {
      print(error);
    }
  }
}
