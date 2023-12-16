import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  final String title;
  final String content;
  final Function() onTap;

  const NotesCard({super.key, required this.title, required this.content, required this.onTap , });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(children: [
        SizedBox(height: 10,),


        InkWell(onTap:onTap,
          child: Container(height: 150,width: double.infinity,decoration: BoxDecoration(borderRadius:
          BorderRadius.circular(10) ,
              color: Colors.grey[300]),
            child: Column(mainAxisAlignment:  MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${title}", style: TextStyle(fontSize: 20),) ,
                  Divider(height: 5,color: Colors.black , endIndent: 40 , indent: 40),
                  Text("${content}", style: TextStyle(fontSize: 20),) ,


                ]),),
        ),


      ]),
    );
  }
}
