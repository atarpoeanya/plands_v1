import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plands_v1/jadwalModel.dart';
import 'package:plands_v1/Database.dart';
import 'dart:ui';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:plands_v1/RepetitionPage.dart';
import 'package:plands_v1/JadwalBloc.dart';

class AddSchedulePage extends StatefulWidget {
  final Jadwal jadwal;

  const AddSchedulePage({Key key, this.jadwal}) : super(key: key);
  @override
  _AddSchedulePage createState() => _AddSchedulePage();
}

class _AddSchedulePage extends State {
//Text validator var
  final _text = TextEditingController();
  bool _validate = false;

  final bloc = JadwalBloc();

  //Variabel placeholder
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
            onPressed: () {},
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/setting');
                },
                child: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(height: 40),
              Container(
                child: TextField(
                  controller: _text,
                  onSubmitted: (text) {
                    _nama.value = text;
                    nama = _nama.value;
                  },
                  onEditingComplete: () {},
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 0),
                    labelText: 'NAMA KEGIATAN',
                    errorText: _validate ? 'Tidak bisa kososng' : null,
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
                onPressed: () {
                  Navigator.pushNamed(context, '/reminder');
                },
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
                    setState(() {
                      _text.text.isEmpty ? _validate = true : _validate = false;
                    });
                    if (!_validate && nama != '') {
                      Jadwal jadwal = Jadwal(
                          nama: nama,
                          timeStart: timeStart.toString(),
                          timeEnd: timeEnd.toString(),
                          isRepeating: isRepeating,
                          hasAlarm: hasAlarm);

                      Navigator.pop(context, jadwal);
                    }
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
                    Navigator.pop(context, false);
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
  void dispose() {
    _text.dispose();
    bloc.dispose();
    super.dispose();
  }
}
