class StudentInfo{
//Private variable as declared using _
   int _id;
   String _name;
   String  _description;
   String _date;
   String _standard;
   int _grade;

   StudentInfo(this._name,this._grade,this._date,this._standard,[this._description]);
   StudentInfo.withId(this._id,this._name,this._grade,this._date,this._standard,[this._description]);   //named constructor

  int get  id => _id;
  int get  grade => _grade;
  String get name => _name;
  String get description => _description;
  String get date => _date;
  String get standard => _standard;

  set grade(int newGrade){
    if(newGrade>=0 && newGrade<=5){
        _grade = newGrade;
    }
  }


  set name(String newName){
      if( newName.length <= 255 ){
        _name = newName;
      }
  }

   set description(String newDescription){
     if( newDescription.length <= 255 ){
       _description = newDescription;
     }
   }

   set standard(String newStandard){
     if( newStandard.length <= 255 ){
       _standard = newStandard;
     }
   }

   set date(String newDate){
     _date = newDate;
   }

   Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["name"] = _name;
    map["description"] = _description;
    map["standard"] = _standard;
    map["grade"] = _grade;
    map["date"]  = _date;
    if(_id != null){
      map["id"] = _id;
    }
    return map;
   }

   StudentInfo.fromObject(dynamic o){
    this._id = o["id"];
    this._standard = o["standard"];
    this._description = o["description"];
    this._name = o["name"];
    this._grade = o["grade"];
    this._date = o["date"];
   }
}