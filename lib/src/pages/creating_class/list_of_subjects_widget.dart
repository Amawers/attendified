import 'package:flutter/material.dart';

class ListOfSubjects extends StatelessWidget {
  String subject_name;
    String subject_code;

  ListOfSubjects({required this.subject_name, required this.subject_code});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(subject_name), const SizedBox(width: 50), Text(subject_code)]);
  }
}
