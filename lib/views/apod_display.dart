import 'package:flutter/material.dart';
import 'package:proj_nasa/models/Apod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ApodDisplay extends StatefulWidget {
ApodModels apodModels;
ApodDisplay({this.apodModels});
  @override
  _ApodDisplayState createState() => _ApodDisplayState();
}

class _ApodDisplayState extends State<ApodDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 90.0,
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 14.0, offset: Offset.zero)],
        borderRadius: BorderRadius.circular(12.0),
      panel: Center(
        child: Text("This is the sliding Widget"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Image.network("", fit: BoxFit.cover,)
      ),
    ),
  );
   
  }
}