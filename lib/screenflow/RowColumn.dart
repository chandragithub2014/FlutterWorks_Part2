import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          color: Colors.greenAccent,
          padding: EdgeInsets.only(top: 30.0, left: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Plain Burger",
                          textDirection: TextDirection.ltr,
                          style:
                              TextStyle(color: Colors.pink, fontSize: 30.0))),
                  Expanded(
                      child: Text("Bread,  Tomato  , Sauce",
                          textDirection: TextDirection.ltr,
                          style:
                              TextStyle(color: Colors.indigo, fontSize: 24.0))),
                ],
              ),
              provideImageFromAsset("cheeseburger"),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Cheese Burger",
                          textDirection: TextDirection.ltr,
                          style:
                              TextStyle(color: Colors.pink, fontSize: 30.0))),
                  Expanded(
                      child: Text("Bread, Cheese, Tomato  , Sauce",
                          textDirection: TextDirection.ltr,
                          style:
                              TextStyle(color: Colors.indigo, fontSize: 24.0))),
                ],
              ),
              ImageWidget(),
              ButtonWidget(),
            ],
          )),
    );
  }

  Container provideImageFromAsset(String imageName){
    AssetImage imageAsset = AssetImage('images/'+imageName+'.png');
   return Container(child: new Image(image:imageAsset,width: 200.0,height: 200.0,),);
  }
}

class ImageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     AssetImage  burgerAsset = AssetImage('images/burger.png');
     Image image = new Image(image: burgerAsset,width: 200.0,height: 200.0);
     return Container(child: image);
  }
}

class ButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var button =  new Container(child: createButton("Click to Order",context),);
    return button;
  }

   RaisedButton createButton(String buttonName,BuildContext context){
       return new RaisedButton(
           child: Text(buttonName),
           color: Colors.orangeAccent,
           elevation: 5.0,
           onPressed: (){
             var alert = AlertDialog(title: Text("This is Your Order"),content: Text("Thanks For Ordering"),);
             showDialog(context: context,
                         builder: (BuildContext) => alert
             );
           });


   }



}
