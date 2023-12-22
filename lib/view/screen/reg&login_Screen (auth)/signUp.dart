import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/Apis/crud.dart';
import 'package:untitled/view/screen/reg&login_Screen%20(auth)/signIn.dart';
import '../../../Apis/linkapi.dart';
import '../../../Apis/notes operation/viewNotes.dart';
import '../../../services/services.dart';
import '../../../themes/apptheme.dart';
import '../../widget/widgets screen (all widgets).dart';

ShowPasswordClass controller = Get.put(ShowPasswordClass());

class SignUp extends StatefulWidget {
  State<SignUp> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<SignUp> {
  var FormKeySignUp = GlobalKey<FormState>();
  final FormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SettingServices myServices = Get.find();
  Crud crud = Crud();
 Future SignUpData() async {
    var response = await crud.postData(LinkSignUp, {
      "name": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });

    if (response != null && response["status"] == "success") {
      Get.off(viewNotesScreen());
      myServices.sharedPrefer.setString("finishLogin", "1");
      Get.snackbar("تسجيل الدخول", "تـم تسجيل الدخول بنجاح");
    } else {
      print("Sign Up Fail");
      Get.snackbar(
        "Sign Up Fail",
        "Fail in Sign Up. Please try again!",
        backgroundColor: Colors.amber,
        borderColor: Colors.cyan,
        borderWidth: 1.5,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic fontcolor=isDark?grayColor:mainColor;

  return Scaffold(
    body:Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Form(
        key: FormKeySignUp,
        child: ListView(children: [
          Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "Note App.",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "Sign Up".tr,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  )),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormFieldScreen(
                controller: usernameController,
                keyboardType: TextInputType.name,
                label: "Enter Your name".tr,
                prefix: Icons.email,
                validator: (value) {
                  return ValidatorScreen(value!, 2, 90, "usernameController");
                },
              ),
              SizedBox(height: 10),
              TextFormFieldScreen(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                label: "Enter Your Email".tr,
                prefix: Icons.email,
                validator: (value) {
                  return ValidatorScreen(value!, 5, 90, "email");
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              GetBuilder<ShowPasswordClass>(builder: (controller){
               if (controller != null && controller.isshowPassword != null) {
             return TextFormFieldScreen(

                    obsureText: controller.isshowPassword,
                    controller: passwordController1,
                    keyboardType: TextInputType.name,
                    label: "Enter New Password".tr,
                    prefix: Icons.lock,
                    validator: (value) {
                      return ValidatorScreen(
                          value!, 6, 90, "passwordController");
                    },
                    suffixIcon: controller.isshowPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    onPressed: () {
                      controller.showPassword();
                    });
              }
               // Add a default return statement if conditions aren't met
               return SizedBox(); // Or any other Widget you want to return as a default
                } ),
              SizedBox(
                height: 20.0,
              ),
              GetBuilder<ShowPasswordClass>(builder: (controller) {
                if (controller != null && controller.isshowPassword != null)
                return TextFormFieldScreen(
                    obsureText: controller.isshowPassword,
                    controller: passwordController,
                    keyboardType: TextInputType.name,
                    label: "Re Enter New Password".tr,
                    prefix: Icons.lock,
                    validator: (value) {
                      if (value != passwordController1.text) {
                        return 'Passwords do not match';
                      }
                      return ValidatorScreen(
                          value!, 6, 90, "passwordController1");
                    },
                    suffixIcon: controller.isshowPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    onPressed: () {
                      controller.showPassword();
                    }); // Add a default return statement if conditions aren't met
    return SizedBox(); // Or any other Widget you want to return as a default
              }),
              SizedBox(
                height: 30.0,
              ),
              MaterialButtonScreen(
                titleOfButton: "Sign Up".tr,
                widthOfButton: double.infinity,
                fontSize: 24,
                fontWeight: FontWeight.normal,
                colorOfButton: mainColor,
                onPressed: () {
                  if (FormKeySignUp.currentState!.validate()) {
                    FormKeySignUp.currentState!.save();
                    SignUpData();
                  }},),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do you have any accout?".tr,style: TextStyle(color: fontcolor)),
                  TextButton(
                    child: Text(
                      "Sign in".tr,
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () {
                      Get.off(() => SignIn());                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
