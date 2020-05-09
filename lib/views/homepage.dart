
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_nasa/models/Apod.dart';
import 'package:proj_nasa/util/apod.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getpictures();
    super.initState();
  }

  getpictures() async {
    apod_api apodclass =apod_api();
    await apodclass.getpictures();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("data"),
      ),
      body: Center(
        child: FutureBuilder<Apod_models>(
          future: getpictures(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Container(
                // whatever
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
          }
          
          )
          
          ),
    );

  }
}
