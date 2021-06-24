import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RepetitionPage extends StatefulWidget {
  // const RepetitionPage({ Key? key }) : super(key: key);

  @override
  _RepetitionPageState createState() => _RepetitionPageState();
}

class _RepetitionPageState extends State<RepetitionPage> {
  //Start Index//
  int repetationIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Repetation', style: TextStyle(color: Colors.black)
        ),
        centerTitle: true,
        backgroundColor: Colors.white
      ),
      body: SettingsList(
        backgroundColor: Colors.transparent,
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "Once",
              trailing: trailingWidget(0),
              onPressed: (BuildContext context) {
              changeRepetition(0);                    },
            ),
            SettingsTile(
              title: "Daily",
              trailing: trailingWidget(1),
              onPressed: (BuildContext context) {
                changeRepetition(1);
              },
            ),
            SettingsTile(
              title: "Weekly",
              trailing: trailingWidget(2),
              onPressed: (BuildContext context) {
                changeRepetition(2);
              },
            ),
            SettingsTile(
              title: "Monthly",
              trailing: trailingWidget(3),
              onPressed: (BuildContext context) {
                changeRepetition(3);
              },
            )
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Balik ke sebelumnya sambil bawa repetation index//
          Navigator.pop(context);
        },
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (repetationIndex == index)
        ? Icon(Icons.check, color: Colors.red)
        : Icon(null);
  }

  void changeRepetition(int index) {
    setState(() {
      repetationIndex = index;
    });
  }
}