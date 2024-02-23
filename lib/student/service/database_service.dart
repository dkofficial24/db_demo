import 'package:db_demo/student/model/student_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final String tableName = 'Student';

  late Database db;

  Future createDatabase() async {
    String dbPath = await getDatabasesPath();
    String dbName = 'school';
    String path = join(dbPath, dbName);
    db = await openDatabase(path, version: 1,
        onCreate: (Database database, int version) async {
      await database.execute(
          'create table $tableName(id integer primary key autoincrement,name text,city text,grade text,fatherName text)');
      print('Table created successfully');
    });
    print('');
  }

  Future insertStudent(StudentModel student) async {
    await db
        .rawInsert('insert into $tableName(name,city,grade,fatherName)');
  }
  
  Future<List<StudentModel>> getAllStudents()async{
    print('');
    List<Map<String,dynamic>> mapList = await db.rawQuery('Select * from $tableName');

    List<StudentModel> studentModelList = [];
    for(int i=0;i<mapList.length;i++){
      Map<String,dynamic> map = mapList[i];
      StudentModel studentModel = StudentModel.fromJson(map);
      studentModelList.add(studentModel);
    }
    return studentModelList;
  }
}
