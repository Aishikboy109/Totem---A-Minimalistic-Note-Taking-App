import 'package:flutter/material.dart';
import 'package:totem_notes/styles/styles.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppStyles.accentColor,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings", style: AppStyles.noteContent,),
          ),
          
          ListTile(
            leading: Icon(Icons.people),
            title: Text("About Us", style: AppStyles.noteContent,),
          ),
        ],
      ),
    );
  }
}