import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

String _basicAuth = 'Basic ' +
    base64Encode(utf8.encode(
        'hamo:Hamo161020@'));

Map<String, String> myheaders = {
  'authorization': _basicAuth
};

// دول عشان الجزء بتاع اخفاء الداتا + الاتثال بالباك انت بدون فتح ماي سيقوال


class Crud {

 getData(url) async{
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
 postData(String url, Map data) async {
  try {
    var response = await http.post(Uri.parse(url), body: data ,  headers: myheaders);

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      //http.Request.headers.addAll(myheaders);
      return responseBody;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Error Catch ححح  : $error');
  }

// postRequestWithFile(String url, Map data, File file) async {
//   var request = http.MultipartRequest("POST", Uri.parse(url));
//   var length = await file.length();
//   var stream = http.ByteStream(file.openRead());
//   var multipartFile = http.MultipartFile("file", stream, length,
//       filename: basename(file.path));
//   request.headers.addAll(myheaders) ;
//   request.files.add(multipartFile);
//   data.forEach((key, value) {
//     request.fields[key] = value ;
//   });
//   var myrequest = await request.send();
//
//   var response = await http.Response.fromStream(myrequest) ;
//   if (myrequest.statusCode == 200){
//     return jsonDecode(response.body) ;
//   }else {
//     print("Error ${myrequest.statusCode}") ;
//   }
}


}

