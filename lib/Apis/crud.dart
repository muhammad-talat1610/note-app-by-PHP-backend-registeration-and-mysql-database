
import 'dart:convert';

import 'package:http/http.dart'as http;


class Crud {

Future getData(url) async{
 try{
   var response=await http.get(Uri.parse(url));
   if(response.statusCode == 200){
      var responseBody= jsonDecode(response.body);
      return responseBody;}
   else{
     print(response.statusCode);

   }
 } catch( e){ return " The Error si $e" ;}
   }


   postData(url, Map data) async{
 try{
   var response=await http.post(Uri.parse(url)  ,  body: data);
   if(response.statusCode == 200){
      var responseBody= jsonDecode(response.body);
      return responseBody;}
   else{
     print(response.statusCode);

   }
 } catch( e){ return " The Error is $e" ;}
   }


 }

