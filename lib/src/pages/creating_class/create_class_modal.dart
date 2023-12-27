
import 'package:attendified/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateClass extends StatelessWidget {
  CreateClass({super.key});
  final User? user = supabase.auth.currentUser;

  TextEditingController subjectNameController = TextEditingController();
  TextEditingController subjectCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        children: [
          const Text('Create Class'),
          Form(
              child: Column(children: [
            TextFormField(
              controller: subjectNameController,
              decoration: const InputDecoration(hintText: 'Subject Name'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: subjectCodeController,
              decoration: const InputDecoration(hintText: 'Subject Code'),
            ),
            ElevatedButton(
                onPressed: () {
                  createSubject(context);
                },
                child: const Text("Create"))
          ]))
        ],
      ),
    );
  }

  Future<void> createSubject(BuildContext context) async {
    try {
      await supabase
          .from('subjects')
          .insert({'subject_name': subjectNameController.text, 'subject_code': subjectCodeController.text});
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message),
      ));
    } catch (error) {
      print(error);
    }
  }
}
