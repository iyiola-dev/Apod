import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proj_nasa/models/Apod.dart';

class apod_api{
List<Apod_models> photos;
  Future<Apod_models> getpictures() async{
    try{
      var response = await http.get(
        "https://api.nasa.gov/planetary/apod?api_key=a0YhPwASDWWtxvKcUEj0S0aVo1Ddd3HFLrm0YTJG"
      );
      if(response.statusCode == 200){
        return Apod_models.fromJson(json.decode(response.body));
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