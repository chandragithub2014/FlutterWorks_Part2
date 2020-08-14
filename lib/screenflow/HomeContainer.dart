import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Center(child : Container(
      alignment: Alignment.center,
      color: Colors.yellowAccent,
      /*width: 192,
      height: 96,*/
      margin: EdgeInsets.only(left: 10.0),
      child: Text("Container",textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.blue, fontSize: 30.0),
                    ),
   )
   );
  }


}