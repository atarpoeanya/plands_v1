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
import 'package:plands_v1/AddSchedulePage.dart';
import 'package:plands_v1/SettingPage.dart';

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
        '/add': (context) => AddSchedulePage(),
        '/third': (context) => RepetitionPage(),
        '/setting' : (context) => SettingPage()
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en', 'US')],
    ),
  );
}

