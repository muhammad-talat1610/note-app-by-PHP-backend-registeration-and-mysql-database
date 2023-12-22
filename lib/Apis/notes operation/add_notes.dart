import 'package:flutter/material.dart';
import 'package:untitled/Apis/crud.dart';
import 'package:untitled/Apis/linkapi.dart';
import 'package:untitled/Apis/notes%20operation/viewNotes.dart';
import '../../services/services.dart';
import 'package:get/get.dart';
import '../../view/widget/widgets screen (all widgets).dart';

class addNotesScreen extends StatefulWidget {
  @override
  _AddNotesScreenState createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<addNotesScreen> {
  GlobalKey<FormState> addNotesForm = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  SettingServices myServices = Get.find();
  Crud crud = Crud();
  bool isloading = false;

  addNotes() async {
    if (addNotesForm.currentState!.validate()) {
      setState(() {
        isloading = true;
      });

      var response = await crud.postData(linkAddNotes, {
        "title": title.text,
        "content": content.text,
        "id": myServices.sharedPrefer.getString("id"),
      });

      setState(() {
        isloading = false;
      });

      if (response["status"] == "success") {
        Get.off(viewNotesScreen());
      } else {
        // Handle error case
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Notes")),
        leading: IconButton(
          onPressed: () {
            Get.off(viewNotesScreen());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Form(
          key: addNotesForm,
          child: ListView(
            children: [
              SizedBox(height: 10.0),
              TextFormField(
                controller: title,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  return ValidatorScreen(value!, 0, 80000, "Title");
                },
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: content,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Content'),
                validator: (value) {
                  return ValidatorScreen(value!, 0, 80000, "Content");
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  addNotes();
                },
                child: Text("ADD"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
