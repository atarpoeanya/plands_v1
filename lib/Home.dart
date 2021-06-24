import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Home extends State<Home> {
  List<int> bottom = <int>[];
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
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
              bottom.add(bottom.length);
            });
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
              onTap: () {},
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      //Content
      body: Container(
        // margin: EdgeInsets.only(top: 70),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              key: centerKey,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    height: 100,
                    width: 50,
                    margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.ac_unit),
                          Column(
                            verticalDirection: VerticalDirection.down,
                            children: [
                              Container(
                                child: Text('Test'),
                              ),
                              Container(
                                child: Text('TIME1'),
                              ),
                              Icon(Icons.remove),
                              Container(
                                child: Text('TIME2'),
                              )
                            ],
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                    ),
                  );
                },
                childCount: bottom.length,
              ),
            ),
          ],
        ),
      ),
      //Bottom navbar//
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add_rounded,
          size: 50,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 30,
            ),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 30,
            ),
            label: 'Test',
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Jadwal {
  final String nama;
  final DateTime firstDate;
  final DateTime secondDate;

  Jadwal(
      {@required this.nama,
      @required this.firstDate,
      @required this.secondDate});
}
