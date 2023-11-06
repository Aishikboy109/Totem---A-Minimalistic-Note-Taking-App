// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:totem_notes/widgets/note_card.dart';

// class NotesView extends StatefulWidget {
//   NotesView(this.noteList,{super.key});
//   List noteList;
//   @override
//   State<NotesView> createState() => _NotesViewState();
// }

// class _NotesViewState extends State<NotesView> {
//   @override
//   Widget build(BuildContext context) {
//     return AnimationLimiter(
//       child: GridView.count(
//         crossAxisCount: 2,
//         children: List.generate(
//           100,
//           (int index) {
//             return AnimationConfiguration.staggeredGrid(
//               position: index,
//               duration: const Duration(milliseconds: 375),
//               columnCount: 2,
//               child: ScaleAnimation(
//                 child: FadeInAnimation(
//                   child: 
//                           noteList.map((note) => noteCard(
//                               () => {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 NoteReaderScreen(note)))
//                                   },
//                               note))
//                           .toList(),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }