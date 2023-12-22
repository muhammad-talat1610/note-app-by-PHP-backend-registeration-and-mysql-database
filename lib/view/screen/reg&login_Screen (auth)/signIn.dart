import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/view/screen/reg&login_Screen%20(auth)/signUp.dart';
import '../../../Apis/crud.dart';
import '../../../Apis/linkapi.dart';
import '../../../Apis/notes operation/viewNotes.dart';
import '../../../services/services.dart';
import '../../../themes/apptheme.dart';
import '../../widget/widgets screen (all widgets).dart';
import 'forgetpassword/forgetpassword.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  ShowPasswordClass controller = Get.put(ShowPasswordClass());
  // SettingServices myservices =Get.put(SettingServices());

  Widget build(BuildContext context) {
    final FormKey = GlobalKey<FormState>();
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic fontcolor=isDark?grayColor:mainColor;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    SettingServices myServices = Get.find();
    myServices.sharedPrefer.setString("login", "1");

    Crud crud = Crud();
    LoginData()async{
      var response = await crud.postData(LinkSignIn, {
        "email" : emailController.text ,
        "password" : passwordController.text,
      });

      if (response["status"]=="success") {
        myServices.sharedPrefer.setString("finishLogin", "1");
      if (response['data'] != null && response['data']['id'] != null) {
         myServices.sharedPrefer.setString("id", response['data']['id'].toString());
         Get.off(
             viewNotesScreen()
         );
          Get.snackbar("تسجيل الدخول", "تـم تسجيل الدخول بنجاح");
        } else {
          print("ID is missing or null in the response data");
        }
      }

      else{
       print(" Sign In Fail");
           Get.snackbar("Sign In Fail", "Fail in Email or Password Please Re-enter agian! ",
               backgroundColor: Colors.amber
           ,borderColor:Colors.cyan, borderWidth: 1.5 , snackPosition:SnackPosition.TOP

           );
      }

    }


    return Scaffold(

      body:Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Form(
          key: FormKey,
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             //   Center(child: Text("Care For You".tr , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold,color: fontcolor ),)),
                SizedBox(height: 15,),
                Center(child: Text("Sign in".tr ,  style: TextStyle(fontSize: 28 , fontWeight: FontWeight.bold ,color: fontcolor),)),
                SizedBox(height: 25,),
                Center(child: Text("Enter Your email and password".tr , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w400 ,color: fontcolor ),)),
                SizedBox(height: 30,),
                // Row( mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Sign as a" , style: TextStyle(fontSize: 33 , fontWeight: FontWeight.bold , ),),
                //     Text(" Nusre" ,  style: TextStyle(fontSize: 33 , fontWeight: FontWeight.bold , color: mainColor),),
                //   ],
                // ),
              ],
            ),

            SizedBox(height: 30.0,),
            TextFormFieldScreen(controller: emailController,
              keyboardType: TextInputType.emailAddress, label:"Enter Your Email ".tr,
              prefix: Icons.email, validator: (value) { return
                ValidatorScreen(value!, 5, 90, "emailController");
              },),
            SizedBox(height: 20.0,),
            GetBuilder<ShowPasswordClass>(builder: (controller) {
              return TextFormFieldScreen(
                  obsureText: controller.isshowPassword,
                  controller: passwordController,
                  keyboardType: TextInputType.name,
                  label: "Enter Your Password".tr,
                  prefix: Icons.lock,
                  validator: (value) {
                    return ValidatorScreen(value!, 6, 90, "password");
                  },
                  suffixIcon:controller.isshowPassword?Icons
                      .visibility_outlined : Icons
                      .visibility_off_outlined,
                  onPressed:(){controller.showPassword();});
            }),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(child: Text(
                  'Forget Password?'.tr ,
                  style: TextStyle(fontSize: 15 , color: Colors.cyan),),onPressed: () {
                  Get.to(ForgetPassword());
                },),],),
            MaterialButtonScreen(titleOfButton: "LOGIN".tr,Icons: Icons.login_outlined , fontSize: 25 ,
              colorOfButton: mainColor,
              onPressed: () async {
                if (FormKey.currentState!.validate()) {
                  LoginData();

                }},),


            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don\'t have any accout?".tr,style: TextStyle(color: fontcolor)),
                TextButton(child:Text("Sign Up".tr , style: TextStyle(color: fontcolor , fontWeight: FontWeight.bold ,     fontSize: 20 ,
                ),textAlign: TextAlign.end, ), onPressed: () {
                  Get.off(() => SignUp());
                },),
              ],)
          ]),
        ),
      ),
    );
  }
}


