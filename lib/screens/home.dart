import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/models/notes.dart';
import 'package:intl/intl.dart';
import 'package:note_app/screens/edit.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> filterLists = [];
  bool sorted = false;

  List<Note>sortnotesbymodifiedTime(List<Note> notes){
    if(sorted){
      notes.sort(((a, b) => a.modifiedTime.compareTo(b.modifiedTime)));
    }else{
       notes.sort(((b, a) => a.modifiedTime.compareTo(b.modifiedTime)));
    }

    sorted = !sorted;

    return notes;
  }

  randomColor(){
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  void onSearchTextChanged(String searchText){
    setState(() {
      filterLists =  sampleNotes.where((element) => element.content.toLowerCase().contains(searchText.toLowerCase()) || element.title.toLowerCase().contains(searchText.toLowerCase())).toList();
    });
   
  }

  void deleteNote(int index){
    setState(() {
      Note note = filterLists[index];
      sampleNotes.remove(note);
      filterLists.removeAt(index);
    });
  }

  @override
  initState(){
      super.initState();
      filterLists = sampleNotes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notes", style: TextStyle(fontSize: 30, color: Colors.white)),
                IconButton(
                  onPressed: (){
                    setState(() {
                      filterLists = sortnotesbymodifiedTime(filterLists);
                    });
                  }, 
                  padding: const EdgeInsets.all(0),
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.grey.shade800.withOpacity(.8), borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.sort, color: Colors.white,)
                    )
                  )
              ],
            ),
            SizedBox(height: 20,),

            TextField(
              onChanged: onSearchTextChanged,
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                hintText: "Search notes...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey.shade800,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent)
                )
              ),
            ),


            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top:30),
                itemCount: filterLists.length,
                itemBuilder: ((context, index) {
                  return   Card(
                    margin: EdgeInsets.only(bottom: 20),
                    color: randomColor(),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        onTap: () async{

                        final result = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditScreen(note: filterLists[index])));
                        if(result != null){
                          setState(() {
                              int originalIndex = sampleNotes.indexOf(filterLists[index]);

                              sampleNotes[originalIndex] = Note(id: sampleNotes[originalIndex].id, content: result[1], title: result[0], modifiedTime: DateTime.now()) ;
                              
                              filterLists[index] = Note(id: sampleNotes[originalIndex].id, content: result[1], title: result[0], modifiedTime: DateTime.now());
                          });
                        }
                        },
                        title: RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: '${filterLists[index].title} \n',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18, height: 1.5),
                            children: [
                              TextSpan(
                                text: "${filterLists[index].content}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  height: 1.5
                                )
                              )
                            ]
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text("Edited: ${DateFormat('EE MMM d, yyyy h:mm a').format(filterLists[index].modifiedTime)}", style: TextStyle(fontSize: 10, color: Colors.grey.shade800, fontStyle: FontStyle.italic),),
                        ),

                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: ()async {
                           final result = await showDialog(
                              context: context, 
                              builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.grey.shade900,
                                icon: const Icon(
                                  Icons.info,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                                title: const Text("Are you sure you want to delete?", style: TextStyle(
                                  color: Colors.white
                                ),),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green
                                      ),
                                      onPressed: (){
                                        Navigator.pop(context, true);
                                      },
                                      child: SizedBox(
                                        child: const Text("Yes", textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                      )
                                    ),
                                     ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red
                                      ),
                                      onPressed: (){
                                        Navigator.pop(context, false);
                                      },
                                      child: SizedBox(
                                        child: const Text("No", textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                      )
                                    )
                                  ],
                                ),
                              );
                            }
                            );

                            if(result){
                              deleteNote(index);
                            }
                            //
                          },
                        ),
                      ),
                    ),
                  );
                }),
                
              ),
            )

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         final result = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const EditScreen()));
         if(result != null){
          setState(() {
              sampleNotes.add(
                Note(id: sampleNotes.length, content: result[1], title: result[0], modifiedTime: DateTime.now())
              );
              filterLists = sampleNotes;
          });
         }
        },
        backgroundColor: Colors.grey.shade800,
        child: Icon(Icons.add, size: 38,),
        elevation: 10,
      ),
    );
  }
}