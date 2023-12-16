import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:untitled/services/services.dart';
import '../note app.dart';
import '../view/screen/Language.dart';
import '../view/screen/reg&login_Screen (auth)/forgetpassword/forgetpassword.dart';
import '../view/screen/reg&login_Screen (auth)/forgetpassword/resetPassword.dart';
import '../view/screen/reg&login_Screen (auth)/forgetpassword/verifycode.dart';
import '../view/screen/reg&login_Screen (auth)/signIn.dart';
import '../view/screen/reg&login_Screen (auth)/signUp.dart';


class MyMiddleWare extends GetMiddleware {
  int? get priority => 1;
  SettingServices myServices = Get.find();
  RouteSettings? redirect(String? route) {
    // if(myServices.sharedPrefer.getString("onboarding") == "1"){
    //   return const RouteSettings(name: AppRoute.login) ;
    // }}
   // myServices.sharedPrefer.setString("id" , "notes_users");
    if(myServices.sharedPrefer.getString("login") == "1"){
      return const RouteSettings(name: AppRoute.noteAppScreen) ;
    }}

}

class AppRoute {
  static const String login = "/login";
  static const String onBoarding = "/onboarding";
  static const String signUp = "/signup";
  static const String forgetPassword = "/forgetpassword";
  static const String verfiyCode = "/verfiycode";
  static const String resetPassword = "/resetpassword";
  static const String successSignUp = "/successsignup";
  static const String successResetpassword = "/successresetpassword";
  static const String checkemail = "/checkemail";
  static const String verfiyCodeSignUp = "/verfiycodesignup";
  static const String noteAppScreen = "/noteAppScreen";
}
List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => AppLanguage() , middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => Test()),
  GetPage(name: AppRoute.login, page: () => SignIn()),
  GetPage(name: AppRoute.signUp, page: () =>  SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () =>  VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () =>  resetPassword()),
  GetPage(name: AppRoute.noteAppScreen, page: () =>  noteAppScreen()),
  // GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  // GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  // GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  // GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
];
