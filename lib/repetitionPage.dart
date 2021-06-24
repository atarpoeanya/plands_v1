import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RepetitionPage extends StatefulWidget {
  // const RepetitionPage({ Key? key }) : super(key: key);

  @override
  _RepetitionPageState createState() => _RepetitionPageState();
}

class _RepetitionPageState extends State<RepetitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Row(
              children: [
                Text('Repetition'),
                Text('data')
              ],
            )
          ],
        ),
      ),
    );
  }
}