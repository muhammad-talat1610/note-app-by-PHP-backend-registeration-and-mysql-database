import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Apis/notes%20operation/edit_notes_screen.dart';
import 'package:untitled/Apis/notes%20operation/viewNotes.dart';

import '../linkapi.dart';
import 'package:get/get.dart';

class cardNotes extends StatelessWidget {
  final String title;
  final String content;
  final Function() onTap;
  final Function() iconButtonMethod;
  final Function() onDismiss;

  const cardNotes({
    required this.title,
    required this.content,
    required this.onTap,
    required this.onDismiss,
    required this.iconButtonMethod,
  });
  @override
  Widget build(BuildContext context) {

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        onDismiss();
      },
      direction: DismissDirection.horizontal, // اتجاه السحب (أفقي)
      child:Row(children: [
     // SizedBox(height: 10,),
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container( width: 150, height: 150,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightGreenAccent[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${title}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis, // Adjust overflow handling
                      ),
                    ),
                    Divider(),
                    IconButton(onPressed: ()async {iconButtonMethod();}, icon: Icon(
                        Icons.highlight_remove_sharp , color: Colors.red,)),
                  ],
                ),
                Expanded(
                  flex: 2, // Adjust the flex value for content size
                  child: Text(
                    "${content}",
                   // overflow: TextOverflow.ellipsis, // Adjust overflow handling
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),



    ]));
  }
}

