import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plands_v1/AddSchedulePage.dart';

import 'package:plands_v1/JadwalBloc.dart';
import 'package:plands_v1/jadwalModel.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Home extends State<Home> {
  List<Jadwal> dummyDatabase = [
    Jadwal(
        nama: "Bermain Bola",
        timeStart: DateTime.now().toString(),
        timeEnd: DateTime.now().toString(),
        hasAlarm: 1,
        isRepeating: 2),
    Jadwal(
        nama: "Memasak",
        timeStart: DateTime.now().toString(),
        timeEnd: DateTime.now().toString(),
        hasAlarm: 0,
        isRepeating: 0),
    Jadwal(
        nama: "Tidur",
        timeStart: DateTime.now().toString(),
        timeEnd: DateTime.now().toString(),
        hasAlarm: 1,
        isRepeating: 3)
  ];

  final bloc = JadwalBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
          onPressed: () async {
            Jadwal rnd = dummyDatabase[Random().nextInt(dummyDatabase.length)];
            bloc.add(rnd);
          },
        ),
        actions: [
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
            //Buat apa ini????
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
          child: StreamBuilder<List<Jadwal>>(
        stream: bloc.jadwals,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Jadwal item = snapshot.data[index];
                    return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          bloc.delete(item.id);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          height: 100,
                          width: 50,
                          margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.access_alarms_outlined,
                                  color: Colors.black,
                                  size: 60,
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //  NAMA
                                    Container(
                                        child: Text(
                                      item.nama,
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                      textAlign: TextAlign.left,
                                    )),

                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(item.timeStart,
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                  ' Jam Mulai '), //Text Harus dikasih Spasi//
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("  -  ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 40)),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(item.timeEnd,
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                  ' Jam Selesai '), //Text Harus dikasih Spasi//
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ));
                  },
                  childCount: snapshot.data.length,
                )),
              ],
            );
          } else {
            return Center(child: Text('Tambahkan Kaegiatanmu!'));
          }
        },
      )),

      //Bottom navbar//
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/add');
          _addPage(context);
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

  void _addPage(BuildContext context) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddSchedulePage()),
    );

    if (res != false) bloc.add(res);
  }
}
