import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totem_notes/helpers/firebase_services.dart';
import 'package:totem_notes/pages/note_editor_page.dart';
import 'package:totem_notes/pages/note_reader_screen.dart';
// import 'package:totem_notes/helpers/open_dialog_box.dart';
import 'package:totem_notes/styles/styles.dart';
import 'package:totem_notes/widgets/navbar.dart';
import 'package:totem_notes/widgets/note_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  // OpenDialogBox dialogBox = OpenDialogBox();

  TextEditingController title_controller = TextEditingController();
  TextEditingController note_controller = TextEditingController();
  FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    final addNoteButton = ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        // color: const Color(0xFFD35656),
        child: GestureDetector(
          child: SizedBox(
            height: 150,
            width: 200,
            child: SvgPicture.asset(
              "assets/Component 2.svg",
            ),
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteEditorPage("new_note"))),
        ),
      ),
    );

    return Scaffold(
      drawer: Navbar(),
      // backgroundColor: Color.fromARGB(255, 224, 142, 142),
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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: SvgPicture.asset("assets/Signature.svg"),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteEditorPage("new_note"))),
                ),
              ],
            ),
          )
        ],
      ),
      body: Stack(children: [
        StreamBuilder<QuerySnapshot>(
            stream: firebaseServices.getNotesStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                List noteList = snapshot.data!.docs;
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimationLimiter(
                        child: MasonryGridView(
                            gridDelegate:
                                SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 210),
                            // crossAxisCount: 2,
                            children:
                                List.generate(noteList.length, (int index) {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: 2,
                                child: ScaleAnimation(
                                    child: FadeInAnimation(
                                        child: noteCard(
                                            () => {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              NoteReaderScreen(
                                                                  noteList[
                                                                      index])))
                                                },
                                            noteList[index],
                                            context))),
                              );
                            }))));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  color: AppStyles.accentColor,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppStyles.cardColor,
                    ),
                  ),
                );
              } else {
                return const Text("no notes");
              }
            }),
        Positioned(
            left: 0,
            right: 0,
            bottom: 20, //set left right to 0 for 100% width
            child: addNoteButton),
      ]),
    );
  }
}


/*
 
// child: GridView(
                    //   // itemCount: 9,
                    //   physics: const ScrollPhysics(),
                    //   gridDelegate:
                    //       const SliverGridDelegateWithFixedCrossAxisCount(
                    //           crossAxisCount: 2),
                    //   children: noteList
                    //       .map((note) => noteCard(
                    //           () => {
                    //                 Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                         builder: (context) =>
                    //                             NoteReaderScreen(note)))
                    //               },
                    //           note))
                    //       .toList(),
                    // ),


                  MasonryGridView.count(
                      // gridDelegate:
                      //     SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 2),
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      itemCount: noteList.length,
                      itemBuilder: (context, index) => ClipRRect(
                          child: noteCard(
                              () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NoteReaderScreen(
                                                    noteList[index])))
                                  },
                              noteList[index])),
                    )

 */

