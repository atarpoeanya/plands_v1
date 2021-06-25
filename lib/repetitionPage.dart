import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'dart:async';
import 'package:plands_v1/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RepetitionPage extends StatefulWidget {
  int repetationIndex;

  RepetitionPage({Key key, this.repetationIndex}) : super(key: key);

  @override
  _RepetitionPageState createState() => _RepetitionPageState();
}

class _RepetitionPageState extends State<RepetitionPage> {
  //Start Index//
  int start = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Repetition',
          style: TextStyle(color: Colors.black, fontSize: 25)),
        centerTitle: false,
        backgroundColor: Colors.transparent),
      body: SettingsList(
        backgroundColor: Colors.transparent,
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "Once",
              trailing: trailingWidget(0),
              onPressed: (BuildContext context) {
                changeRepetition(0);
              },
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
          Navigator.pop(context, widget.repetationIndex);
        },
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(color: Colors.white),
            ],
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (widget.repetationIndex == index)
        ? Icon(Icons.check, color: Colors.red)
        : Icon(null);
  }

  void changeRepetition(int index) {
    setState(() {
      widget.repetationIndex = index;
    });
  }
}
