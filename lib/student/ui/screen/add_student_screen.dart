import 'package:db_demo/student/model/student_model.dart';
import 'package:db_demo/student/service/database_service.dart';
import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: gradeController,
              decoration: InputDecoration(labelText: 'Grade'),
            ),
            TextField(
              controller: fatherNameController,
              decoration: InputDecoration(labelText: 'Father\'s Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Create a new StudentModel object using the data entered
                StudentModel newStudent = StudentModel(
                  name: nameController.text,
                  city: cityController.text,
                  grade: gradeController.text,
                  fatherName: fatherNameController.text,
                );

                DatabaseService databaseService = DatabaseService();
                await databaseService.insertStudent(newStudent);
                print('Data added successfully');
              },
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}
