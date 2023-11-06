import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rounded_rectangle_border/custom_rounded_rectangle_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totem_notes/helpers/firebase_services.dart';
import 'package:totem_notes/styles/styles.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc, context) {
  FirebaseServices firebaseServices = FirebaseServices();
  return InkWell(
    onTap: onTap,
    onLongPress: () {
      AwesomeDialog(
          context: context,
          // dialogType: DialogType.question,
          animType: AnimType.scale,
          title: "Delete Note?",
          dialogBackgroundColor: AppStyles.primaryColor,
          transitionAnimationDuration: Duration(milliseconds: 3),
          customHeader: Container(
            // color: AppStyles.primaryColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppStyles.primaryColor
            ),
            
            child: Center(
              child: Icon(
                // color: Colors.black,
                Icons.warning,
                size: 60,
              ),
            ),
          ),
          btnOk: IconButton(
            icon: Icon(Icons.check),
            // style: ButtonStyle(
            //   iconColor: AppStyles.accentColor
            // ),
            onPressed: () async {
              await firebaseServices.deleteNote(doc.id);
              Navigator.pop(context);
            },
          ),
          btnCancel: IconButton(
            icon: Icon(Icons.clear_rounded),
            // style: ButtonStyle(
            //   iconColor: AppStyles.accentColor
            // ),
            onPressed: () async {
              // await firebaseServices.deleteNote(doc.id);
              Navigator.pop(context);
            },
          )
          // titleTextStyle:
          )
        ..show();
    },
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        // width: 128,
        // height: 121,
        decoration: ShapeDecoration(
          color: AppStyles.cardColor,
          shape: CustomRoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
            leftSide: BorderSide(color: Colors.black),
            bottomLeftCornerSide: BorderSide(color: Colors.black),
            rightSide: BorderSide(color: Colors.black),
            bottomRightCornerSide: BorderSide(color: Colors.black),
            bottomSide: BorderSide(color: Colors.black),
            topSide: BorderSide(color: Colors.black),
            topLeftCornerSide: BorderSide(color: Colors.black),
            topRightCornerSide: BorderSide(color: Colors.black),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doc["note_title"], style: AppStyles.noteTitle),

              // const SizedBox(height: 4,),

              const SizedBox(
                height: 2,
              ),

              Text(doc["note_content"], style: AppStyles.noteContent),
            ],
          ),
        ),
      ),
    ),
  );
  // );
}

// showDialog(
//           context: context,
//           builder: (context) => Dialog(
//                 alignment: AlignmentDirectional.center,

//                 backgroundColor: AppStyles.cardColor,
//                 child: Column(
//                   children: [
//                     Text("Do you want to delete this note?"),
// TextButton(
//   onPressed: () async {
//     await firebaseServices.deleteNote(doc.id);
//     Navigator.pop(context);
//   },
//   child: Text(
//     "Ok",
//     style: TextStyle(
//       color: Colors.black
//     ),
//   ),
// ),
// TextButton(
//   onPressed: () {
//     Navigator.pop(context);
//   },
//   child: Text(
//     "Cancel",
//     style: TextStyle(
//       color: Colors.black
//     ),
//   ),
// ),
//                   ],
//                 ),
//               ));
