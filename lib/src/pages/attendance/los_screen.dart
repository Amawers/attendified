import 'package:attendified/main.dart';
import 'package:attendified/src/pages/attendance/los_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListOfStudentsScreen extends StatefulWidget {
  @override
  State<ListOfStudentsScreen> createState() => _ListOfStudentsScreenState();
}

class _ListOfStudentsScreenState extends State<ListOfStudentsScreen> {
  final User? user = supabase.auth.currentUser;
  List<String> subjects = [];
  List<String> sections = [];
  String? selectedSubject;
  String? selectedSection;

  List<dynamic> studentAttendanceData = [];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await getListOfSubjects();

    await getTeacherDetails();
  }

  Future<void> getListOfSubjects() async {
    String? userId = user?.id;

    try {
      final unconvertedSubjects =
          await supabase.rpc('get_subjects_for_teacher');
      final unconvertedSections =
          await supabase.rpc('get_sections_for_teacher');
      
      print('data type of response ${unconvertedSubjects.runtimeType}');

      setState(() {
        subjects = List<String>.from(unconvertedSubjects
            .map((dynamic subject) => subject['subject_name'].toString()));
        sections = List<String>.from(unconvertedSections
            .map((dynamic section) => section['section_name'].toString()));
      });

      print('the subjects are $subjects');
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> getTeacherDetails() async {
    try {
      String? curUserEmail = user?.email;

      final response = await supabase.rpc('get_attendance_data', params: {
        'p_teacher_email': curUserEmail,
        'p_subject_name': selectedSubject,
        'p_section_name': selectedSection
      });

      print('THE RUN TIME TYPE in LOS SCREEN: ${response.runtimeType}');
      print('The values: ${response} /n');

      setState(() {
        studentAttendanceData = response;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Students'),
      ),
      body: Column(
        children: [
          DropdownButton(
            items: subjects.map((String subject) {
              return DropdownMenuItem(value: subject, child: Text(subject));
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedSubject = newValue;
              });
              getTeacherDetails();
            },
            hint: Text('Select a subject'),
          ),
          DropdownButton(
            items: sections.map((String sections) {
              return DropdownMenuItem(value: sections, child: Text(sections));
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedSection = newValue;
              });
              getTeacherDetails();
            },
            hint: Text('Select a section'),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView.builder(
              itemCount: studentAttendanceData.length,
              itemBuilder: (context, index) {
                return ListOfStudentsWidget(
                  first_name: studentAttendanceData[index]['first_name'],
                  last_name: studentAttendanceData[index]['last_name'],
                  attendance_status: studentAttendanceData[index]
                      ['attendance_status'],
                );
              },
            ),
          ),
        ],
      ),
      // bottomSheet:BottomSheet(onClosing: () => Navigator.pop(context), builder: (BuildContext context) {
      //         return Container(
      //           height: 200,
      //           color: Colors.amber,
      //           child: Center(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               mainAxisSize: MainAxisSize.min,
      //               children: <Widget>[
      //                 const Text('Modal BottomSheet'),
      //                 ElevatedButton(
      //                   child: const Text('Close BottomSheet'),
      //                   onPressed: () => Navigator.pop(context),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       },),
    );
  }
}
