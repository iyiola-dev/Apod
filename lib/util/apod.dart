import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proj_nasa/models/Apod.dart';
import 'package:proj_nasa/util/api_key.dart';

class ApodApi{


  Future<ApodModels> getpictures(String selectedDate) async{
    try{
      var response = await http.get(
        "https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$selectedDate"
      );
      var apiod = ApodModels.fromJson(json.decode(response.body));
      if(apiod.imageUrl != "null" ){
        return apiod;
      }
      else{
        throw Exception('failed to load data');
      }
     
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}