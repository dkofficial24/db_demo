import 'package:db_demo/student/service/database_service.dart';
import 'package:db_demo/student_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseService databaseService = DatabaseService();
  Get.put(databaseService);
  await databaseService.createDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student DB Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentDashboardScreen(),
    );
  }
}
