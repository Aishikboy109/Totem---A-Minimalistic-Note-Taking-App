// import 'package:flutter/material.dart';
// import 'package:totem_notes/helpers/firebase_services.dart';

// class OpenDialogBox {
//   TextEditingController title_controller = TextEditingController();
//   TextEditingController note_controller = TextEditingController();
//   FirebaseServices firebaseServices = FirebaseServices();

//   void openDialogBox(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               content: Stack(
//                 children: [
//                   TextField(
//                     controller: title_controller,
//                     autofocus: true,
//                     decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         label: Text("title"),
//                         hintText: "Title"),
//                   ),
//                   TextField(
//                     controller: note_controller,
//                     autofocus: true,
//                     decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         label: Text("note"),
//                         hintText: "Note"),
//                   ),
//                 ],
//               ),
//               actions: [
//                 IconButton(onPressed: () => {
//                   firebaseServices.addNotes(title_controller.text, note_controller.text)
//                 }, icon: const Icon(Icons.send))
//               ],
//             ));
//   }
// }
