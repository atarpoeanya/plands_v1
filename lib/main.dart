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
      supportedLocales: [
        const Locale('en', 'US')
      ],
    ),
  );
}

class AddSchedulePage extends StatefulWidget {
  @override
  _AddSchedulePage createState() => _AddSchedulePage();
  //State<Home> createState() => _Home();
}

class _AddSchedulePage extends State {
  final nmCtrl = TextEditingController();
  DateTime fromDate;
  DateTime toDate;

  @override
  void initState() {
    fromDate = DateTime(DateTime.now());
    toDate = DateTime(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> top = <int>[];
    List<int> bottom = <int>[0];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('PLAND',
            style: GoogleFonts.righteous(
                textStyle: TextStyle(color: Colors.black, fontSize: 30))),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              top.add(-top.length - 1);
              bottom.add(bottom.length);
            });
            bottom.add(bottom.length);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                top.add(top.length + 1);
              },
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
                controller: nmCtrl,
                decoration: InputDecoration(
                  hintText: "Nama Kegiatan"
                ),
            ),
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Row(                  
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('From',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.righteous(
                      textStyle:TextStyle(
                        fontSize: 12
                      )
                    )
                  ),
                  InkWell(
                    child: Container(
                      child:Row(                          
                        children: <Widget>[
                          Text(new print(DateFormat.yMMMd().format(DateTime.now())),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                            ),
                          ),
                          new Image.asset('asset/right-arrow.png')
                        ],
                      ),
                    ),
                    onTap: () async {
                      DateTime newDateTime = await showRoundedDatePicker(
                        context: context,
                        initialDate: DateTime(DateTime.now()),
                        firstDate: DateTime(DateTime.now()),
                        lastDate: DateTime(DateTime.now().year+1000),
                        borderRadius: 16
                      );
                      if (newDateTime != null) {
                        setState(() => fromDate = newDateTime);
                      }
                    },
                  )
                ],
              ),
              child: ButtonBar(alignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    color: Colors.blue,
                    onPressed: () {
                      var strDate = new DateFormat(("dd MMM yyyy")).format(fromDate);
                      var mname = '${nm.text} '
                                  '\nFrom: $strDate';
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(mname)
                          );
                        }
                      );
                    },
                  ),
                  TextButton(
                    child: Text('Cancel'),
                    color: Colors.red,
                    onPressed: () {
                      nmCtrl.clear();
                      setState(() => fromDate = DateTime(DateTime.now())),
                    }
                  )
                ];
              ),
              child: Row(                  
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('To',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.righteous(
                      textStyle:TextStyle(
                        fontSize: 12
                      )
                    )
                  ),
                  InkWell(
                    child: Container(
                      child:Row(                          
                        children: <Widget>[
                          Text(new print(DateFormat.yMMMd().format(DateTime.now())),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                            ),
                          ),
                          new Image.asset('asset/right-arrow.png')
                        ],
                      ),
                    ),
                    onTap: () async {
                      DateTime newDateTime = await showRoundedDatePicker(
                        context: context,
                        initialDate: DateTime(DateTime.now()),
                        firstDate: DateTime(DateTime.now()),
                        lastDate: DateTime(DateTime.now().year+1000),
                        borderRadius: 16
                      );
                      if (newDateTime != null) {
                        setState(() => fromDate = newDateTime);
                      }
                    },
                  )
                ],
              ),
              child: ButtonBar(alignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    color: Colors.blue,
                    onPressed: () {
                      var strDate = new DateFormat(("dd MMM yyyy")).format(fromDate);
                      var mname = '${nm.text} '
                                  '\nFrom: $strDate';
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(mname)
                          );
                        }
                      );
                    },
                  ),
                  TextButton(
                    child: Text('Cancel'),
                    color: Colors.red,
                    onPressed: () {
                      nmCtrl.clear();
                      setState(() => fromDate = DateTime(DateTime.now())),
                    }
                  )
                ];
              )
            ),
            children: <Widget>[
              margin: EdgeInsets.fromLTRB(34, 257, 25, 357),
              Text("Repeat: ",
                  style: TextStyle(fontSize: 14)),
              style: ButtonStyle(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey)),
              new DropdownButton<String>(
                onChanged: popupButtonSelected,
                value: "One-Time Event",
                style: new TextStyle(fontSize:14,
                color: Colors.black,
                fontWeight: FontWeight.w200,
                fontFamily: "Righteous"),
                items: <DropdownMenuItem<String>>[
                  const DropdownMenuItem<String>(value: "Weekly",
                    child: const Text("Weekly Event")),
                  const DropdownMenuItem<String>(value: "Monthly",
                    child: const Text("Monthly Event")),
                  const DropdownMenuItem<String>(value: "Semestrial",
                    child: const Text("Semestrial Event")),
                  const DropdownMenuItem<String>(value: "Annual",
                    child: const Text("Annual Event")),
                ],
              ),
            ],
            children: <Widget>[
              margin: EdgeInsets.fromLTRB(34, 310, 25, 304),
              Text("Reminders: ",
                  style: TextStyle(fontSize: 14)),
              style: ButtonStyle(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey)),
              new DropdownButton<String>(
                onChanged: popupButtonSelected,
                value: "5 Minutes Before",
                style: GoogleFonts.righteous(TextStyle(fontSize:14,
                color: Colors.black,
                fontWeight: FontWeight.w200)),
                items: <DropdownMenuItem<String>>[
                  const DropdownMenuItem<String>(value: "1 Minutes Before",
                    child: const Text("1 Minutes Before")),
                  const DropdownMenuItem<String>(value: "15 Minutes Before",
                    child: const Text("15 Minutes Before")),
                  const DropdownMenuItem<String>(value: "30 Minutes Before",
                    child: const Text("30 Minutes Before")),
                  const DropdownMenuItem<String>(value: "1 Hours Before",
                    child: const Text("1 Hours Before")),
                  const DropdownMenuItem<String>(value: "1 Days Before",
                    child: const Text("1 Days Before")),
                ],
              ),
            ],
          ],
          TextButton(
            margin: EdgeInsets.fromLTRB(35, 460, 24, 143),
            child: Text("Save",
              style: GoogleFonts.righteous(
                textStyle: TextStyle(color: Colors.black, fontSize: 24))
            ),
            style: ButtonStyle(
              //height: 37,
              //width: 301,
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),)
              )
            ),
              onPressed: () => null
          );
          TextButton(
            margin: EdgeInsets.fromLTRB(35, 502, 24, 111),
            child: Text("Cancel",
              style: GoogleFonts.righteous(
                textStyle: TextStyle(color: Colors.black, fontSize: 24))
            ),
            style: ButtonStyle(
              //height: 37,
              //width: 301,
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
              ),
            ),
              onPressed: () => null
          );
        );
      );
    );
  }
}