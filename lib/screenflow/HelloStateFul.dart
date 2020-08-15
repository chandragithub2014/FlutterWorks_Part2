import 'package:flutter/material.dart';

class HelloStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloStateFul> {
  String name = '';
  final _Currencies = ['Ruppes','Euro','Dollars','pounds'];
  String _selectedCurrency = "Ruppes";
  TextEditingController mobileNumberController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: mobileNumberController,
            decoration: InputDecoration(
                labelText: "Mobile Number",
                labelStyle: textStyle,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                borderSide: new BorderSide(width : 1 ,color: Colors.red)),
                hintText: "Please enter Mobile Number"),
            keyboardType: TextInputType.number,
            /*onChanged: (String string) {
              setState(() {
                name = string;
              });
            },*/
          ),
          DropdownButton<String>(
            items: _Currencies.map((String value) =>
                DropdownMenuItem(value: value,child : Text(value))).toList(),
              value: _selectedCurrency,
              onChanged: (String value){
                _onSelectedItemChanged(value);
              },
          ),
          RaisedButton(
            child: Text('Submit', textScaleFactor: 1.5,),
              color: Theme.of(context).primaryColorDark,
              textColor: Theme.of(context).primaryColorLight,

              onPressed: (){
              setState(() {
                result = mobileNumberController.text;
              });
                 }
                 ),


          Text(
            result,
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );


  }
   _onSelectedItemChanged(String value){
    setState(() {
      this._selectedCurrency = value;
    });
  }
}
