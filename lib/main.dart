import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:plands_v1/Database.dart';
import 'package:plands_v1/Home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:plands_v1/repetitionPage.dart';
import 'package:plands_v1/jadwalModel.dart';

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
        '/third': (context) => RepetitionPage()
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
  final Jadwal jadwal;

  const AddSchedulePage({Key key, this.jadwal}) : super(key: key);
  @override
  _AddSchedulePage createState() => _AddSchedulePage();
  //State<Home> createState() => _Home();
}

class _AddSchedulePage extends State {
  int id = 0;
  String nama = '';
  ValueNotifier<String> _nama = ValueNotifier('');

  DateTime timeStart = DateTime.now();
  DateTime timeEnd = DateTime.now();
  ValueNotifier<DateTime> _timeStart = ValueNotifier<DateTime>(DateTime.now());
  ValueNotifier<DateTime> _timeEnd = ValueNotifier<DateTime>(DateTime.now());

  int hasAlarm = 1;
  int isRepeating = 0;

  String tempRep = 'Once';

  ValueNotifier<int> _isRepeating = ValueNotifier<int>(0);
  ValueNotifier<int> _hasAlarm = ValueNotifier<int>(1);
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
                  onSubmitted: (text) {
                    _nama.value = text;
                    nama = _nama.value;
                  },
                  onEditingComplete: () {},
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
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[400]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2100, 1, 1, 00, 00),
                            onConfirm: (date) {
                          timeStart = date;
                          _timeStart.value = date;
                        }, locale: LocaleType.en);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'From',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            ValueListenableBuilder(
                                valueListenable: _timeStart,
                                builder: (BuildContext context,
                                    DateTime _dateTimeNotifier, Widget child) {
                                  return Text(
                                      DateFormat.yMMMMEEEEd()
                                          .add_jm()
                                          .format(_dateTimeNotifier),
                                      style: TextStyle(color: Colors.black));
                                })
                          ],
                        ),
                      )),
                  SizedBox(height: 5),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[400]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            minTime: _timeStart.value ?? DateTime.now(),
                            maxTime: DateTime(2100, 1, 1, 00, 00),
                            onConfirm: (date) {
                          timeEnd = date;
                          _timeEnd.value = date;
                        }, locale: LocaleType.en);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'To',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            ValueListenableBuilder(
                                valueListenable: _timeEnd,
                                builder: (BuildContext context,
                                    DateTime _dateTimeNotifier, Widget child) {
                                  return Text(
                                      DateFormat.yMMMMEEEEd()
                                          .add_jm()
                                          .format(_dateTimeNotifier),
                                      style: TextStyle(color: Colors.black));
                                })
                          ],
                        ),
                      )),
                  SizedBox(height: 5),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[400]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                      onPressed: () async {
                        _isRepeating.value = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new RepetitionPage(
                                        repetationIndex: _isRepeating.value)));
                        isRepeating = _isRepeating.value;

                        isRepeating == 0
                            ? tempRep = 'Once'
                            : isRepeating == 1
                                ? tempRep = 'Daily'
                                : isRepeating == 2
                                    ? tempRep = 'Weekly'
                                    : tempRep = 'Monthly';
                        updateText();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Repeat',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(tempRep, style: TextStyle(color: Colors.black))
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[400]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ))),
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Reminder',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text('5 minutes before',
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () async {
                    print(
                        '$nama, $timeStart, $timeEnd, $isRepeating, $hasAlarm');
                    Jadwal jadwal = Jadwal(
                        nama: nama,
                        timeStart: timeStart.toString(),
                        timeEnd: timeEnd.toString(),
                        isRepeating: isRepeating,
                        hasAlarm: hasAlarm);
                    debugPrint(jadwal.toString());

                    await DBProvider.db.newJadwal(jadwal);
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                        child: Text(
                          'Save',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
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
    setState(() {});
  }

  dateMaker(DateTime s, BuildContext context) {
    DatePicker.showDateTimePicker(context,
        minTime: DateTime(2010, 1, 1, 00, 00),
        maxTime: DateTime(2100, 1, 1, 00, 00), onConfirm: (date) {
      updateText();
    }, locale: LocaleType.en);
  }

  @override
  void initState() {
    super.initState();
    updateText();
  }
}
