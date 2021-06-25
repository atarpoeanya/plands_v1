import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'dart:async';
import 'package:plands_v1/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ReminderPage extends StatefulWidget {
  //Ini Buat Apa sih//
  int reminderIndex;

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  //Here We Go Again Tar//
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Reminder',
          style: TextStyle(color: Colors.black, fontSize: 25)),
        centerTitle: false,
        backgroundColor: Colors.transparent),
      body: SettingsList(
        backgroundColor: Colors.transparent,
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "None",
              trailing: trailingWidget(0),
              onPressed: (BuildContext context) {
                changeReminder(0);
              },
            ),
            SettingsTile(
              title: "on time",
              trailing: trailingWidget(1),
              onPressed: (BuildContext context) {
                changeReminder(1);
              },
            ),
            SettingsTile(
              title: "5 minutes before",
              trailing: trailingWidget(2),
              onPressed: (BuildContext context) {
                changeReminder(2);
              },
            ),
            SettingsTile(
              title: "1 hours before",
              trailing: trailingWidget(3),
              onPressed: (BuildContext context) {
                changeReminder(3);
              },
            )
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Balik ke sebelumnya sambil bawa repetation index//
          Navigator.pop(context, widget.reminderIndex);
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
    return (widget.reminderIndex == index)
        ? Icon(Icons.check, color: Colors.red)
        : Icon(null);
  }

  void changeReminder(int index) {
    setState(() {
      widget.reminderIndex = index;
    });
  }
}