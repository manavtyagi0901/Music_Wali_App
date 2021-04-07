import 'package:music_wali_app/models/singers.dart';
import 'package:music_wali_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:music_wali_app/utils/server.dart';
import 'dart:convert' as convert;

class SingerService{
 getSinger(Function callback){
   List<Singer>singer=[];
   Future<http.Response> future=Server.callServer(Constants.SINGER_URL);

   future.then((http.Response response) {
     String json=response.body;
     print("JSON data is $json");
     Map<String,dynamic> map=  convert.jsonDecode(json);
      List<dynamic> listofmap=map['singers'];
     singer= listofmap.map((dynamic map){
        Singer ob=new Singer(map['name'],map['photo']);

         return ob;
      }).toList();
     print("Singers are $singer");
     // print(singer[0]);
     // print(singer[1]);
     callback(singer);
   }).catchError((err)=> print("Error occur during the fetchthe data from json file $err"));


 }
}