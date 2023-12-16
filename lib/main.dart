
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/services/localization%20(languages%20of%20app)/change%20language%20by%20button.dart';
import 'package:untitled/services/localization%20(languages%20of%20app)/change%20language%20by%20device%20lang.dart';
import 'package:untitled/services/middleware.dart';
import 'package:untitled/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

 //SettingServices myservices = Get.put(SettingServices());
 //SettingServices myservices = Get.find();
//MyServices myServices = Get.put(MyServices()) ;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingServices myServices = Get.put(SettingServices()) ;

    return GetMaterialApp(
   //   home: AppLanguage(),
translations: mylocale(),
    locale:langController.language,
      theme: langController.appTheme,
      //   initialBinding: myBinding(),
    debugShowCheckedModeBanner: false,
      getPages: routes,

    );

  }
}
