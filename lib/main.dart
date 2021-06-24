import 'dart:html';

import 'package:flutter/material.dart';
import 'package:plands_v1/Home.dart';
//import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Pland',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => AddSchedulePage(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en', 'US')],
    ),
  );
}

class AddSchedulePage extends StatefulWidget {
  @override
  _AddSchedulePage createState() => _AddSchedulePage();
  //State<Home> createState() => _Home();
}

class _AddSchedulePage extends State {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    try {
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(height: 40),
              Container(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 0),
                    labelText: 'NAMA KEGIATAN',
                    alignLabelWithHint: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Form Thu, 22 Apr 2021 21:30 >'),
                      )),
                  SizedBox(height: 5),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                      onPressed: () {},
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [Text('Form'), new Text(i.toString())],
                          ))),
                  SizedBox(height: 5),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.grey),
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Repeat One-time event >'),
                      )),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey),
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text('Reminder 5 minutes Before >'),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {},
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                        child: Text(
                          'Save',
                          textAlign: TextAlign.center,
                        ),
                      ))),
              SizedBox(height: 5),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                        ),
                      ))),
            ],
          ),
        ),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  updateText() async {
    setState(() {
      i = i;
    });
  }

  @override
  void initState() {
    super.initState();
    updateText();
  }
}
