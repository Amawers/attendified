import 'package:attendified/src/pages/creating_class/create_class_modal.dart';
import 'package:attendified/src/pages/creating_students/create_students_screen.dart';
import 'package:flutter/material.dart';

class ListOfStudents extends StatelessWidget {
  String subject_name;
  String subject_code;

  ListOfStudents({required this.subject_name, required this.subject_code});

  @override
  Widget build(BuildContext context) {
    return  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subject_name),
              const SizedBox(width: 50),
              Text(subject_code)
            ]);
  }
}
