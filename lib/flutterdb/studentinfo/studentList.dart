import 'package:flutter/material.dart';
import 'package:first_flutter_app/flutterdb/model/StudentInfo.dart';
import 'package:first_flutter_app/flutterdb/utils/dbhelper.dart';
import 'package:first_flutter_app/flutterdb/studentinfo/StudentDetail.dart';
import 'package:intl/intl.dart';

class StudentList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StudentListState();

}

class StudentListState extends State{
  DbHelper dbHelper = DbHelper();
  List<StudentInfo> studentList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      if(studentList == null){
        studentList = List<StudentInfo>();
        getData();
      }
      return Scaffold(
         body : toListItems(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            navigateToStudentDetail(StudentInfo('',3,'',"10th"));
          },
          tooltip: "Add New Item",
          child:  new Icon(Icons.add),
        ),
      );
  }

  ListView toListItems(){

 return   ListView.separated(
     padding: const EdgeInsets.all(8),
     itemCount: count,
     itemBuilder: (BuildContext context, int index) {
       return Card(
         color: Colors.white,
         elevation: 3.0,
         child: ListTile(
           leading: CircleAvatar(
             backgroundColor: getColor(this.studentList[index].grade),
             child: Text(this.studentList[index].grade.toString()),
           ),
           title: Text(this.studentList[index].name),
           subtitle: Text(this.studentList[index].date),
           onTap: (){
             debugPrint("Tapped on "+this.studentList[index].id.toString());
             navigateToStudentDetail(this.studentList[index]);
           },
         ),
       );
     },
     separatorBuilder: (BuildContext context, int index) => const Divider(),
     );
  }

  Color getColor(int grade) {
    switch (grade) {
      case 1:
        return Colors.green;
        break;
      case 2:
        return Colors.orange;
        break;
      case 3:
        return Colors.red;
        break;

      default:
        return Colors.orange;
    }
  }
  void getData(){
    final dbFuture = dbHelper.initializeDB();
    dbFuture.then((result) {
      final studentListFuture = dbHelper.getStudentDetails();
      studentListFuture.then((result) {
        count = result.length;
        List<StudentInfo>  tempStudentList = List<StudentInfo>();
        for(int i = 0; i<count;i++){
          tempStudentList.add(StudentInfo.fromObject(result[i]));
          debugPrint(tempStudentList[i].name);
        }

        setState(() {
          studentList = tempStudentList;
          count = count;
        });
      });
    }

    );
  }

  void navigateToStudentDetail(StudentInfo studentInfo) async{

     bool result = await Navigator.push(context, 
         MaterialPageRoute(builder: (context) => StudentDetail(studentInfo)),);
     if(result == true){
       getData();
     }
  }



}
