import 'package:flutter/material.dart';
import 'package:untitled/Apis/linkapi.dart';
import 'package:untitled/Apis/notes%20operation/edit_notes_screen.dart';

import '../crud.dart';

class DeleteNotesScreen extends StatelessWidget {

  Crud crud = Crud();
  deleteNotes(){
    var response =  crud.postData(linkDeleteNotes, {
      "id": myServices.sharedPrefer.remove("notes_id")
    });
 //if(response["status"]=="success"){}
  }

  Widget build(BuildContext context) {
    return Scaffold(



    );
  }
}
