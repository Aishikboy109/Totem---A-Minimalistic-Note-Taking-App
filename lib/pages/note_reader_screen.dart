import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:totem_notes/helpers/firebase_services.dart';
import 'package:totem_notes/pages/note_editor_page.dart';
import 'package:totem_notes/styles/styles.dart';

class NoteReaderScreen extends StatelessWidget {
  const NoteReaderScreen(this.doc, {super.key});
  final QueryDocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
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
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    FirebaseServices()
                        .deleteNote(doc.id)
                        .then((value) => {Navigator.pop(context)})
                        .catchError((error) => {print(error)});
                  },
                  icon: Icon(Icons.delete)),
              IconButton(
                  onPressed: () {
                    // EDIT code
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteEditorPage(doc.id)));
                  },
                  icon: Icon(Icons.edit)),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doc["note_title"], style: AppStyles.noteTitle),
            const SizedBox(
              height: 4,
            ),
            // Text(doc["creation_date"], style: AppStyles.dateTitle),
            // const SizedBox(
            //   height: 4,
            // ),
            Text(doc["note_content"], style: AppStyles.noteContent),
          ],
        ),
      ),
    );
  }
}
