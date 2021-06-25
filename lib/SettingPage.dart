import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'dart:async';
import 'package:plands_v1/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 90),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Icon dan Text digedein//
                Icon(
                  Icons.settings,
                  size: 40,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 25)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Default Reminder//
                  //TODO: Ngasih Default Pilihan//
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Default Reminder',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '5 minutes before',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),

                  SizedBox(height: 5),

                  //Notification Sound//
                  //TODO: Ngasih Defalut Pilihan//
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Notification Sound',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Lullaby',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),

      //Tombol Balik//
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
              BoxShadow(color: Colors.transparent),
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
}
