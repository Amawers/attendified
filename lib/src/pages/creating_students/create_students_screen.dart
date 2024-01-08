import 'package:attendified/main.dart';
import 'package:attendified/src/pages/creating_class/create_class_modal.dart';
import 'package:attendified/src/pages/creating_students/list_of_students_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentsList extends StatefulWidget {
  String? subject_name;
  String? subject_code;
  StudentsList({required this.subject_name, required this.subject_code});

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  final User? user = supabase.auth.currentUser;

  List<dynamic> studentList = [];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await getStudentList();
  }

  Future<void> getStudentList() async {
    try {
      String? curUserEmail = user?.email;

      print('before fetch, subject name is: ${widget.subject_name}');
      print('before fetch, section name is: ${widget.subject_code}');

      final response = await supabase.rpc('get_list_of_students', params: {
        'p_subject_name': widget.subject_name,
        'p_section_name': widget.subject_code
      });

      print('THE RUN TIME TYPE in LOS SCREEN: ${response.runtimeType}');
      print('The students is: ${response} /n');

      setState(() {
        studentList = response;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, '/bottom_navbar', (route) => false)),
        title: const Text('Students List'),
      ),
      body: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index) {
            return ListOfStudents(
                subject_name:
                    studentList[index]['first_name'] ?? 'Null nia, e edit lang',
                subject_code:
                    studentList[index]['last_name'] ?? 'Null nia, e edit lang');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(child: CreateClass()));
        },
        child: const Text('Add Student',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
