import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proj_nasa/models/Apod.dart';

class ApodApi{
  Future<ApodModels> getpictures() async{
    try{
      var response = await http.get(
        "https://api.nasa.gov/planetary/apod?apiKey=a0YhPwASDWWtxvKcUEj0S0aVo1Ddd3HFLrm0YTJG"
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