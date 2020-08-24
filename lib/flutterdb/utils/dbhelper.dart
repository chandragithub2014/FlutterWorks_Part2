import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:first_flutter_app/flutterdb/model/StudentInfo.dart';

class DbHelper{
  //Creating singleton
  static final DbHelper _dbHelper = DbHelper._internal();   //Here _internal is named constructor. It can be any name.

  //
  String tblStudent = "studentinfo";
  String colId = "id";
  String colName = "name";
  String colDescription = "description";
  String colDate = "date";
  String colStandard = "standard";
  String  colGrade = "grade";

  DbHelper._internal();

  //factory allows to create only single instance of a class.
  factory DbHelper(){
   return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
     if(_db == null){
       _db = await initializeDB();
     }
     return _db;
  }

  Future<Database> initializeDB() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "students.db";
    var studentDB = await openDatabase(path , version: 1,onCreate: _createDb);
    return studentDB;
  }

  void _createDb(Database db , int newVersion) async{

    await db.execute("CREATE TABLE $tblStudent($colId  INTEGER PRIMARY KEY , $colName TEXT, "+
    "$colDescription TEXT, $colDate TEXT, $colGrade INTEGER, $colStandard TEXT )");
  }

  Future<int> insertData(StudentInfo studentInfo) async{
    Database db = await this.db;
    var result = await db.insert(tblStudent, studentInfo.toMap());
    print("Result is "+result.toString());
    return result;


  }

  Future<List> getStudentDetails() async{
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * FROM $tblStudent order by $colGrade ASC");
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("select count (*) from $tblStudent")
    );
    return result;
  }


  Future<int> updateTodo(StudentInfo studentInfo) async {
    Database db = await this.db;
    var result = await db.update(tblStudent, studentInfo.toMap(),
        where: "$colId = ?", whereArgs: [studentInfo.id]);
    return result;
  }

  Future<int> deleteTodo(int id) async {
    Database db = await this.db;
    int result;
    result = await db.rawDelete('DELETE FROM $tblStudent WHERE $colId = $id');
    return result;
  }
  /*
     String _name;
   String  _description;
   String _date;
   String _standard;
   int _grade;

   */
}