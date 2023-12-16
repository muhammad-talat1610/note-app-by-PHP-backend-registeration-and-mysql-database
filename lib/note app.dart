import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Apis/crud.dart';
import 'package:untitled/Apis/server%20ink.dart';
import 'package:untitled/services/services.dart';
import 'package:untitled/view/screen/reg&login_Screen%20(auth)/signIn.dart';

SettingServices myServices = Get.find();
//var id = myServices.sharedPrefer.getString("id") ;
class noteAppScreen extends StatelessWidget {
  Crud crud = Crud();

  Future viewNotes() async {
    var userId = myServices.sharedPrefer.getString("id");
    var response = await crud.postData(LinkViewNotes, {
      "id": userId ,
    });
    print('User ID: $userId');
    return response ;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("note app")),
        actions: [
          IconButton(
            onPressed: () {
              myServices.sharedPrefer.clear();
              Get.off(SignIn());
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder(
        future: viewNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(

                  title:Text(snapshot.data != null && snapshot.data![index]['title'] != null
                      ? snapshot.data![index]['title']
                      : ""),
                  subtitle: Text(snapshot.data != null && snapshot.data![index]['content'] != null
                      ? snapshot.data![index]['content']
                      : ""),
                  // تأكد من التحقق من القيم قبل استخدامها لتجنب الأخطاء
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Column(
              children: [
                Text("data"),
                Text("data"),
                Text("data"),
              ],
            ),
            backgroundColor: Colors.cyan,
            ignoreSafeArea: true,
            elevation: 2,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
