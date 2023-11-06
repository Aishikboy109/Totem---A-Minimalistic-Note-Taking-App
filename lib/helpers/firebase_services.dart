import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");

  // CREATE : add note
  Future<void> addNotes(String title, String note) {
    return notes.add({
      "note_title": title,
      "note_content": note,
      "timestamp": Timestamp.now()
    });
  }

  // READ : get notes
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  // UPDATE : update note with given doc id
  Future<void> updateNotes(String docID, String? newTitle, String? newNote) {
    return notes.doc(docID).update({
      "note_title": newTitle,
      "note_content": newNote,
      "timestamp": Timestamp.now()
    });
  }
  // DELETE : delete note with given doc id

  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
