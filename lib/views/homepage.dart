
import 'package:flutter/material.dart';
import 'package:proj_nasa/models/Apod.dart';
import 'package:proj_nasa/util/apod.dart';
import 'package:proj_nasa/views/apod_display.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  final ApodModels apodModels; //= new ApodModels();
  Home({this.apodModels});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now();
  ApodModels apodModels;
  static const spinkit = SpinKitChasingDots(
  color: Colors.white,
  size: 50.0,
);
  @override
  void initState() {
    getpictures();
    super.initState();
  }

  Future<ApodModels> getpictures() async {
    ApodApi apodclass =ApodApi();
    ApodModels data = await apodclass.getpictures(selectedDate.toString());
    apodModels = data;
    return data;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Text("Astronomical", style:  GoogleFonts.tenorSans(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w400))),
            Text(" picture", style:  GoogleFonts.tenorSans(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w400))),
            Text(" of the day", style: GoogleFonts.tenorSans(textStyle: TextStyle(fontSize: 20,))),
 
          ],
        ),
      ),
      backgroundColor: Colors.grey,
        body: Center(
          child: FutureBuilder<ApodModels>(
      future: getpictures(),
      builder: (context, snapshot){
          if(snapshot.hasData){
            return Container(
              padding: EdgeInsets.all(50.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 500,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.white24),
                    child: Center(child: 
                    Text("Select date from the date picker below you'd be automatically directed to the Astronomical picture of the day(Apod)",
                     style: GoogleFonts.acme(
                       textStyle: TextStyle(fontSize: 20))),
                  ),),
                  SizedBox(height: 50,),
                  Text("$selectedDate", style: GoogleFonts.tenorSans(fontSize: 24),),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.blue[400],
                    onPressed: (){
                    _selectDate(context);
                    
                  },
                  child: Text("Select Date"),
                  )
                ],
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
          return spinkit;
      }
      
      ),
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
        await getpictures();
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> ApodDisplay(apodModels: apodModels)));
        return picked;
      }else{
        return DateTime.now();
      }
  }
}
