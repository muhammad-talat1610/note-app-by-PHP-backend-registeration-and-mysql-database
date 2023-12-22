
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Apis/crud.dart';
import 'package:untitled/Apis/linkapi.dart';
import 'package:untitled/Apis/notes%20operation/add_notes.dart';
import 'package:untitled/Apis/notes%20operation/cardNotes.dart';
import 'package:untitled/view/screen/reg&login_Screen%20(auth)/signIn.dart';
import 'package:get/get.dart';
import 'edit_notes_screen.dart';

//var id = myServices.sharedPrefer.getString("id") ;



class viewNotesScreen extends StatefulWidget {
  @override
  State<viewNotesScreen> createState() => _viewNotesScreenState();
}

class _viewNotesScreenState extends State<viewNotesScreen> {
  Crud crud = Crud();

  Future viewNotes() async {
    var userId = myServices.sharedPrefer.getString("id");
    var response = await crud.postData(linkViewNotes, {
      "id": userId ,
    });
    print('User ID: $userId');
    return response ;
  }

  deleteNotes(notesId) async {
    var response = await crud.postData(linkDeleteNotes, {
      "id": notesId.toString(),
    });
    if (response != null && response["status"] == "success") {
      Get.offAndToNamed('/viewNotesScreen');
      // الطريقة دي خلت الصفحة تعمل ريفريش بعد ما حذفت الملاحظة
      return true;
    } else {
      return false;
    }
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
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: viewNotes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                if (snapshot.data["status"] == "Fail") return Center(child: Text("you don't have notes to show.. "));

                return GridView.builder(
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return cardNotes(
                    onDismiss:()async{await deleteNotes(snapshot.data['data'][index]["notes_id"]);} ,
                      onTap: () {
                        Get.to(editNotesScreen(
                         //  editTitle:snapshot.data['data'][index]["notes_title"],
                         //  editContent: snapshot.data['data'][index]["notes_content"],
                          notes:snapshot.data['data'][index] ,
                        )) ;
                      },
                      title: snapshot.data['data'][index]["notes_title"],
                      content: snapshot.data['data'][index]["notes_content"],
                      iconButtonMethod: () async {await deleteNotes(snapshot.data['data'][index]["notes_id"]);},
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عدد العناصر في كل صف
                    crossAxisSpacing: 0.0, // المسافة بين العناصر الأفقية
                    mainAxisSpacing: 0.0, // المسافة بين العناصر العمودية
                  ),
                );
              }
              else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());}

              else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("No data available"));}
 return Center(child: Text("No Notes available"));

            }),
        ],
      ),
      floatingActionButton: FloatingActionButton( backgroundColor: Colors.teal,
        onPressed: () {
          Get.off(addNotesScreen());
        },
        child: Icon(Icons.add ),
      ),
    );
  }
}