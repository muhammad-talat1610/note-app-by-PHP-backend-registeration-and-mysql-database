import 'package:flutter/material.dart';
import 'package:untitled/Apis/linkapi.dart';
import 'package:untitled/Apis/notes%20operation/viewNotes.dart';
import '../../services/services.dart';
import '../../view/widget/widgets screen (all widgets).dart';
import '../crud.dart';
import 'package:get/get.dart';


class editNotesScreen extends StatefulWidget {
final notes ;
  const editNotesScreen({Key? key, this.notes}) : super(key: key);

  @override
  _EditNotesScreenState createState() => _EditNotesScreenState();
}
GlobalKey<FormState> editNotesForm = GlobalKey<FormState>();
TextEditingController title = TextEditingController();
TextEditingController content = TextEditingController();

SettingServices myServices = Get.find();
Crud crud = Crud();
bool isloading = false;


@override
class _EditNotesScreenState extends State<editNotesScreen> {
  editNotes() async {
    if (editNotesForm.currentState!.validate()) {
      setState(() {
        isloading = true;
      });

      var response = await crud.postData(linkEditNotes, {
        "title": title.text,
        "content": content.text,
         "id": widget.notes["notes_id"].toString(),
      });

      setState(() {
        isloading = false;
      });

      if (response["status"] == "success") {
        Get.off(viewNotesScreen());
      } else {
        print("No change occar");
        Get.off(viewNotesScreen()); // هنا يتم الانتقال إلى صفحة عرض الملاحظات بغض النظر عن نتيجة العملية

        // Handle error case
      }
    }
  }
void initState(){
    title.text=widget.notes["notes_title"];
    content.text=widget.notes["notes_content"];
    super.initState();
}


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Edit Notes")),
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
          key: editNotesForm,
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

              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async{
                  editNotes();
                },
                child: Text("EDIT"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
