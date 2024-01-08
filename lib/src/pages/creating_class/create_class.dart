import 'package:attendified/main.dart';
import 'package:attendified/src/pages/creating_class/create_class_modal.dart';
import 'package:attendified/src/pages/creating_class/list_of_subjects_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClassList extends StatefulWidget {
  const ClassList({super.key});

  @override
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  final User? user = supabase.auth.currentUser;

  List<dynamic> converted = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await getListOfSubjects();
    });
  }

  Future<void> getListOfSubjects() async {
    String? userId = user?.id;

    try {
      final response = await supabase.rpc('get_subjects_for_teacher');  // Assuming 'user_id' is the column linking to users

      print(response);
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/bottom_navbar', (route) => false)
        ),
        title: const Text('Class List'),
      ),
      body: ListView.builder(
          itemCount: converted.length,
          itemBuilder: (context, index) {
            return ListOfSubjects(subject_name: converted[index]['subject_name'], subject_code: converted[index]['subject_code'] ?? 'Null nia, e edit lang');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(child: CreateClass()));
        },
        child: const Text('Add Subject',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
