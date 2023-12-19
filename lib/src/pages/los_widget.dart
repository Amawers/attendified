import 'package:attendified/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListOfStudentsWidget extends StatefulWidget {
  @override
  State<ListOfStudentsWidget> createState() => _ListOfStudentsWidget();
}

class _ListOfStudentsWidget extends State<ListOfStudentsWidget> {
  final User? user = supabase.auth.currentUser;

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
          .from('attendance')
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
    return Text('data');
  }
}
