import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/localization (languages of app)/change language by button.dart';
import 'onboarding.dart';

class AppLanguage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
            Text("Choose your Language".tr , style:  TextStyle( fontFamily: "cairo", fontSize: 30 ,color: Colors.black87 ,fontWeight: FontWeight.bold, fontStyle:FontStyle.normal )
            ),
            SizedBox(height: 20.0,),

            Container(width: 200,
              child: ElevatedButton( onPressed: () {
                langController.changeLanguage("ar");
                Get.to(onboarding());
                }, child: Text("Arabic".tr , style:
              TextStyle( fontFamily: "cairo", fontSize: 30 ,color: Colors.black87 ,fontWeight: FontWeight.bold, fontStyle:FontStyle.normal )
              )),
            ),
            SizedBox(height: 20.0,),
            Container(width: 200,
              child: ElevatedButton(onPressed: () {
              langController.changeLanguage("en");
                Get.to(onboarding());
              }, child: Text("English".tr , style:
              TextStyle( fontFamily: "cairo", fontSize: 30 ,color: Colors.black87 ,fontWeight: FontWeight.bold, fontStyle:FontStyle.normal )
              )),
            ),


      ],
    ),));
  }
}
