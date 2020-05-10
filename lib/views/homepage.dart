




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_nasa/models/Apod.dart';
import 'package:proj_nasa/util/apod.dart';

class Home extends StatefulWidget {
  final ApodModels apodModels; //= new ApodModels();
  Home({this.apodModels});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)=>getpictures(context));
    super.initState();
  }

  Future<ApodModels> getpictures(context) async {
    ApodApi apodclass =ApodApi();
   var selected =  _selectDate(context);
    return await apodclass.getpictures(selected.toString());
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("data", style: TextStyle(color: Colors.blue)),
      ),
      body: Center(
        child: FutureBuilder<ApodModels>(
          future: getpictures(context),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text("$selectedDate"),
                      SizedBox(height: 20.0,),
                      RaisedButton(onPressed: (){
                        _selectDate(context);
                        
                      },
                      child: Text("Select Date"),
                      )
                    ],
                  ),
                ),
              );
            }
            else if(snapshot.hasError){
              return AlertDialog(
                content: Column(
                  children: <Widget>[
                    Text("${snapshot.error}"),
                    FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("close"))    
                  ],
                ),
                
                
              );
            }
            return CircularProgressIndicator();
          }
          
          )
          
          ),
    );
  }
  Future<DateTime> _selectDate(BuildContext context) async{
    final  DateTime picked = await showDatePicker(
      context: context, 
      initialDate: selectedDate, 
      firstDate: DateTime(1995, 6, 16), 
      lastDate: DateTime.now()
      );
      if(picked != null && picked != selectedDate){
        setState(() {
          selectedDate = picked;
          
        });
        
          return picked;
      }else{
        return DateTime.now();
      }
  }
}
