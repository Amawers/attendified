import 'package:attendified/main.dart';
import 'package:attendified/src/pages/attendance/los_attendance_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListOfStudentsWidget extends StatelessWidget {
  String first_name;
  String last_name;
  String attendance_status;
  ListOfStudentsWidget({required this.first_name, required this.last_name, required this.attendance_status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0x009a9a9a).withOpacity(1),
            offset: const Offset(0, 3),
            blurRadius: 5,
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 22, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: const Icon(
                    Icons.account_circle,
                    size: 50,
                    color: Colors.blueAccent,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //first name of the student
                    Text(
                      first_name,
                      style: const TextStyle(
                        color: Color(0xFF1C2C4B),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //last name of the student
                    Text(
                      last_name,
                      style: const TextStyle(
                        color: Color(0xFF1C2C4B),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StudentAttendanceStatus(attendance_status: attendance_status),
          ],
        ),
      ),
    );
  }
}
