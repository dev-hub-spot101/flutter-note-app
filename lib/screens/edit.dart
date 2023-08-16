import 'package:flutter/material.dart';
import 'package:note_app/models/notes.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({super.key, this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

 @override
  initState(){
    if(widget.note != null){
      _title = TextEditingController(text: widget.note!.title);
      _content = TextEditingController(text: widget.note!.content);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade900,
       body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   IconButton(
                      onPressed: (){
                       Navigator.pop(context);
                      }, 
                      padding: const EdgeInsets.all(0),
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.grey.shade800.withOpacity(.8), borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.arrow_back_ios, color: Colors.white,),
                        )
                        )
                      )
                ],
              ),

              Expanded(
                child: ListView(
                  children:  [
                      TextField(
                        controller: _title,
                        style: TextStyle(
                          color: Colors.white,fontSize: 30
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Title",
                          hintStyle:  TextStyle(
                          color: Colors.grey,fontSize: 30
                        ),

                        ),
                      ),
                      TextField(
                        maxLines: null,
                        controller: _content,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Message...",
                          hintStyle:  TextStyle(
                          color: Colors.grey
                        ),

                        ),
                      )
                  ],
                ),
              )

            ],
          ),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) => const EditScreen()));
          Navigator.pop(context, [
            _title.text, _content.text
          ]);
        },
        backgroundColor: Colors.grey.shade800,
        child: Icon(Icons.save,),
        elevation: 10,
      ),
    );
  }
}