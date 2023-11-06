import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:totem_notes/helpers/firebase_services.dart';
import 'package:totem_notes/styles/styles.dart';

class NoteEditorPage extends StatelessWidget {
  NoteEditorPage(this.flag, {super.key});
  String flag;
  TextEditingController title_controller = TextEditingController();
  TextEditingController note_controller = TextEditingController();
  FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    // String did = docID;
    return Scaffold(
      backgroundColor: AppStyles.accentColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppStyles.primaryColor,
        title: Text(
          "TOTEM",
          style: AppStyles.appBarTitle,
        ),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(13),
            ),
            side: BorderSide(width: 1.3, color: Colors.black)),
            
        leading: IconButton(
          onPressed: () async => {
            if (note_controller.text.length != 0 &&
                title_controller.text.length != 0 &&
                flag == "new_note")
              {
                firebaseServices
                    .addNotes(title_controller.text, note_controller.text)
                    .then((value) => {Navigator.pop(context)})
                    .catchError((error) => {print(error)})
              }
            else if (note_controller.text.length != 0 &&
                title_controller.text.length != 0 &&
                flag != "new_note")
              {
                // String docid = docID;
                firebaseServices
                    .updateNotes(
                        flag, title_controller.text, note_controller.text)
                    .then((value) => {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst)
                        })
                    .catchError((error) => {print(error)})
              }
            else
              {Navigator.pop(context)}
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                // keyboardType: TextInputType.multiline,
                controller: title_controller,
                // autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  // hintStyle: AppStyles.noteTitle
                )),
            const SizedBox(
              height: 10,
            ),

            Expanded(
              child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: note_controller,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Note",
                      hintStyle: AppStyles.noteContent)),
            ),
          ],
        ),
      ),
    );
  }
}
