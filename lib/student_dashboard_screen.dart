import 'package:db_demo/student/model/student_model.dart';
import 'package:db_demo/student/service/database_service.dart';
import 'package:db_demo/student/ui/screen/add_student_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDashboardScreen extends StatefulWidget {
  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  List<StudentModel> students = [];

  @override
  void initState() {
    loadStudents();
    super.initState();
  }

  Future loadStudents() async {
    await Future.delayed(Duration(seconds: 1));
    DatabaseService databaseService = Get.find();
    students = await databaseService.getAllStudents();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddStudentScreen();
          }));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          StudentModel studentModel = students[index];

          return Card(
            child: ListTile(
              title: Text(studentModel.name),
              subtitle:
                  Text('ID: ${studentModel.id} | Grade: ${studentModel.grade}'),
              onTap: () {
                // Handle tapping on a student card, e.g., navigate to student details screen
              },
            ),
          );
        },
      ),
    );
  }
}
