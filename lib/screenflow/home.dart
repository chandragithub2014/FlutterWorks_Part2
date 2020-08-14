import 'package:flutter/material.dart';

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Material(
            color: Colors.white,
            child: Center(
              child: Text(
                           sayGreetings(),
                             textDirection: TextDirection.ltr,
                             style: TextStyle(color: Colors.blue,fontSize: 24.0),
             ),
            ),
      );
  }

  //Functions
String sayGreetings(){
    String greeting;
    DateTime now = new DateTime.now();
    int hour = now.hour;
    if(hour <= 12){
      greeting = "Good Morning Flutter !!!";
    }else if(hour < 18){
      greeting = "Good Afternoon Flutter";
    }else{
      greeting = "Good Evening Flutter";
    }
    return greeting;
}
}