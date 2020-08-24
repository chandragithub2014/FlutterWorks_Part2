import 'package:first_flutter_app/flutterdb/utils/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:first_flutter_app/flutterdb/model/StudentInfo.dart';

DbHelper dbHelper = DbHelper();
final List<String> choices = const ["Save","Delete","Back"];
const menuSave = "Save";
const menuDelete = "Delete";
const menuBack = "Back";

class StudentDetail extends StatefulWidget {
  final StudentInfo studentInfo;

  StudentDetail(this.studentInfo);

  @override
  State<StatefulWidget> createState() => StudentDetailState(studentInfo);
}

class StudentDetailState extends State {
  StudentInfo studentInfo;

  StudentDetailState(this.studentInfo);

  final _grades = ["Distinction", "FirstClass", "Fail"];
  String _grade = "Fail";
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleEditingController.text = studentInfo.name;
    descriptionEditingController.text = studentInfo.description;

    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //Disable back button on Top explicitly
        title: Text(studentInfo.name),
        actions: <Widget>[
           PopupMenuButton(
               onSelected: select,
               itemBuilder: (BuildContext context){
                  return choices.map((String  choice){
                     return PopupMenuItem(
                         value: choice,
                         child: Text(choice),);
                  }).toList();
               }
           ),
          
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
        Column(
          children: <Widget>[
            TextField(
              controller: titleEditingController,
              style: textStyle,
              decoration: InputDecoration(
                labelStyle: textStyle,
                labelText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionEditingController,
                style: textStyle,
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: "Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                  )
                ),
              ),
            ),
            ListTile(title: DropdownButton<String>(
              items: _grades.map((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value));
              }).toList(),
              style: textStyle,
              value: "Fail",
              onChanged: (value) => _grade,
            ),
            )
          ],
        ),
          ],
        ),
      ),
    );
  }

  void select(String selected) async{
    int result;
    switch(selected){
      case menuSave:
        debugPrint("Selected Save");
        break;
      case menuDelete:
           debugPrint("Selected Delete");
           break;
      case menuBack:
           debugPrint("Selected Back");
           Navigator.pop(context,true);
           break;
    }
  }
}
