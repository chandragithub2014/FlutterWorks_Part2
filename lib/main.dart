
import 'package:first_flutter_app/flutterdb/studentinfo/studentList.dart';
import 'package:first_flutter_app/screenflow/HelloStateFul.dart';
import 'package:flutter/material.dart';
import './screenflow/home.dart';
import './screenflow/HomeContainer.dart';
import './screenflow/RowColumn.dart';
import './flutterdb/model/StudentInfo.dart';
import './flutterdb/utils/dbhelper.dart';

void main() => runApp(new HelloFlutterApp());

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student List",
      theme: new ThemeData(primarySwatch: Colors.deepOrange,),
      home:  new StudentListHome(title: 'Student List'),
    );
  }
}

class StudentListHome extends StatefulWidget{
  StudentListHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState()  => new LauncherStudentList();

}

class LauncherStudentList extends State<StudentListHome>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text("Hello Flutter App Bar"),
        ),
      body: StudentList(),

    );
  }
  
}
