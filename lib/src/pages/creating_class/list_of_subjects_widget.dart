import 'package:attendified/src/pages/creating_class/create_class_modal.dart';
import 'package:attendified/src/pages/creating_students/create_students_screen.dart';
import 'package:flutter/material.dart';

class ListOfSubjects extends StatelessWidget {
  String subject_name;
  String subject_code;

  ListOfSubjects({required this.subject_name, required this.subject_code});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(child: StudentsList(subject_name: subject_name, subject_code: subject_code)));
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subject_name),
              const SizedBox(width: 50),
              Text(subject_code)
            ]));
  }
}
