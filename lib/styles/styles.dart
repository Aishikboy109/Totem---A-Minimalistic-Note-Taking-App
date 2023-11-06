import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static Color mainColor = const Color.fromARGB(255, 0, 0, 0);
  static Color accentColor = Color.fromARGB(255, 235, 188, 188);
  static Color primaryColor = const Color(0xFFD45757);
  static Color cardColor = const Color(0xFF947676);

  static TextStyle noteTitle =
      GoogleFonts.jetBrainsMono(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle dateTitle =
      GoogleFonts.jetBrainsMono(fontSize: 11, fontWeight: FontWeight.w500);
  static TextStyle noteContent =
      GoogleFonts.jetBrainsMono(fontSize: 14.0, fontWeight: FontWeight.normal);
  static TextStyle appBarTitle =
      GoogleFonts.jetBrainsMono(fontSize: 22.0, fontWeight: FontWeight.normal);
  static TextStyle addNoteButton =
      GoogleFonts.jetBrainsMono(fontSize: 15.0, fontWeight: FontWeight.w500);
}
