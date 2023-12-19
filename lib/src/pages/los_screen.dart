import 'package:attendified/main.dart';
import 'package:attendified/src/pages/los_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListOfStudentsScreen extends StatefulWidget {
  @override
  State<ListOfStudentsScreen> createState() => _ListOfStudentsScreenState();
}

class _ListOfStudentsScreenState extends State<ListOfStudentsScreen> {
  final User? user = supabase.auth.currentUser;

  List<dynamic> converted = [];

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
          .rpc('get_attendance_data', params: {'p_teacher_name': 'Xendi', 'p_subject_name': 'Information Security Assurance', 'p_section_name': 'R7'});

      print('THE RUN TIME TYPE in LOS SCREEN: ${response.runtimeType}');
      print('The values: ${response} /n');

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
      appBar: AppBar(
        title: const Text('List of Students'),
      ),
      body: const Column(
        children: [
          Text('Header'),
        ],
      ),
    );
  }
}
