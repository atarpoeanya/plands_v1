import 'dart:html';

import 'package:flutter/material.dart';
import 'package:plands_v1/Home.dart';
import 'package:flutter/painting.dart';

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
    ),
  );
}

class AddSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Pland',
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 150.0,
              width: 300.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: new Center(
                  child: new Text("Pland", 
                  style: TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.center),),
              ),
            ),
          ],
        ),*/
      ),
      body: Center(
        /*const EdgeInsets.fromLTRB(
          double left,
          double top,
          double right,
          double bottom
        )*/
        child: Container(
          Text('Nama Kegiatan',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w400,
              fontFamily: 'Righteous',
              color: Colors.black87),
          ),
          EdgeInsets.fromLTRB(41, 88, 44, 514),
        );
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            width: 301,
            height: 27,
            EdgeInsets.fromLTRB(34, 195, 25, 418),
          );
          child: new Center(
            child: new Text("From", 
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,
              fontFamily: 'Righteous',),
            textAlign: TextAlign.left),
            EdgeInsets.fromLTRB(34, 195, 247, 420),
            Text("Thu, 22 Apr 2021 21:30", 
            style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400,
              fontFamily: 'Righteous',),
            textAlign: TextAlign.right),
            EdgeInsets.fromLTRB(155, 200, 63, 421),
          ),
        );
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            width: 301,
            height: 27,
            EdgeInsets.fromLTRB(34, 225, 25, 388),
          ),
          child: new Center(
            child: new Text("To", 
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,
              fontFamily: 'Righteous',),
            textAlign: TextAlign.left),
            EdgeInsets.fromLTRB(34, 226, 247, 389),
            Text("Thu, 22 Apr 2021 21:30", 
            style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400,
              fontFamily: 'Righteous',),
            textAlign: TextAlign.right),
            EdgeInsets.fromLTRB(155, 229, 63, 392),
          ),
        );
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            width: 301,
            height: 27,
            EdgeInsets.fromLTRB(34, 257, 25, 357),
          ),
          child: new Center(
            child: new Text("Repeat", 
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,
              fontFamily: 'Righteous',),
            textAlign: TextAlign.left),
            EdgeInsets.fromLTRB(34, 257, 247, 358),
            Text("One Time Event", 
            style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400,
              fontFamily: 'Righteous',),
            textAlign: TextAlign.right),
            EdgeInsets.fromLTRB(197, 259, 63, 362),
          ),
        );
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            width: 301,
            height: 27,
            EdgeInsets.fromLTRB(34, 310, 25, 304),
          ),
          child: new Center(
            child: new Text("Reminders", 
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,
              fontFamily: 'Righteous',),
            textAlign: TextAlign.left),
            EdgeInsets.fromLTRB(34, 310, 214, 305),
          ),
          child: new Text("5 Minutes Before", 
            style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400,
              fontFamily: 'Righteous',),
            textAlign: TextAlign.right,
            EdgeInsets.fromLTRB(195, 314, 63, 307),
          );
        );
      )
    );
  }
}
