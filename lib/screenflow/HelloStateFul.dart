import 'package:flutter/cupertino.dart';
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
  TextEditingController incomeEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();
  String result = "";
  final double _formDistance = 5.0;


  @override
  Widget build(BuildContext context) {
TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
          top: _formDistance,
          bottom:_formDistance
      ),
              child:
          TextField(
            controller: mobileNumberController,
            decoration: InputDecoration(
                labelText: "Mobile Number",
                labelStyle: textStyle,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                    borderSide: new BorderSide(width : 1 ,color: Colors.red)),
                hintText: "Please enter Mobile Number"),
            keyboardType: TextInputType.number,

          ) ),
    Padding(
    padding: EdgeInsets.only(
    top: _formDistance,
    bottom:_formDistance
    ),
    child:TextField(
            controller: ageEditingController,
            decoration: InputDecoration(
                labelText: "Age ",
                labelStyle: textStyle,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                    borderSide: new BorderSide(width : 1 ,color: Colors.red)),
                hintText: "Please enter age"),
            keyboardType: TextInputType.number,

    ) ),

    Padding(
    padding: EdgeInsets.only(
    top: _formDistance,
    bottom:_formDistance
    ),
    child: Row(
    children: [
      Expanded(child:
      TextField(
        controller: incomeEditingController,
        decoration: InputDecoration(
            labelText: "Annual Income",
            labelStyle: textStyle,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                borderSide: new BorderSide(width : 1 ,color: Colors.red)),
            hintText: "Please enter Annual Income"),
        keyboardType: TextInputType.number,

      )
      ),
      Container(width: _formDistance * 5),
      Expanded(child:
      DropdownButton<String>(
        items: _Currencies.map((String value) =>
            DropdownMenuItem(value: value,child : Text(value))).toList(),
        value: _selectedCurrency,
        onChanged: (String value){
          _onSelectedItemChanged(value);
        },
      ),

      ),
     ],
    ),
    ),
     Padding(
       padding: EdgeInsets.only(top: _formDistance,bottom: _formDistance),
       child: Row(

         children: [

           Expanded(child:
               Padding(padding: EdgeInsets.only(right: 6.0),
               child:  RaisedButton(
                   child: Text('Submit', textScaleFactor: 1.5,),
                   color: Theme.of(context).primaryColorDark,
                   textColor: Theme.of(context).primaryColorLight,

                   onPressed: (){
                     setState(() {
                       result = fetchTheLoanEligibleAmount();//mobileNumberController.text;
                     });
                   }
               ),),
          ),

           Expanded(child:
           RaisedButton(
               child: Text('Reset', textScaleFactor: 1.5,),
               color: Theme.of(context).buttonColor,
               textColor: Theme.of(context).primaryColorDark,

               onPressed: (){
                 _resetData();
               }
           ),
            ),
          ],
       ),
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

  _resetData(){

    mobileNumberController.text = "";
    ageEditingController.text = "";
    incomeEditingController.text = "";
    setState(() {
      result = "";
    });
  }

  String fetchTheLoanEligibleAmount(){
    String eligibleLoanAmount = "";
    double age = double.parse(ageEditingController.text);
    double income = double.parse(incomeEditingController.text);

    if(age <= 20 && income <= 20000){
      eligibleLoanAmount = "You are eligible for "+(income*2).toStringAsFixed(2)+" "+_selectedCurrency+ " Loan Amount ";
    }else if(age>20 && age <= 30 && income <= 30000 ){
      eligibleLoanAmount = "You are eligible for "+(income*3).toStringAsFixed(2)+" "+_selectedCurrency+ " Loan Amount ";
    }else if(age>=30 && income > 30000){
      eligibleLoanAmount = "You are eligible for "+(income*4).toStringAsFixed(2)+ " "+_selectedCurrency+ " Loan Amount ";
    }else{
      eligibleLoanAmount = "You are not eligible for  Loan Amount ";
    }
    return eligibleLoanAmount;
  }
}
