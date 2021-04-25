import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PageController ctrl = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key}) :
  // super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List _childern = [
      Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
        ),
      )
    ];
    return Scaffold(
      body: Stack(
        children: [
          topBar(),
          _childern[0],
          Positioned(left: 0, right: 0, bottom: 0, child: bottomNavbar()),
        ],
      ),
    );
  }

  Widget topBar() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(Icons.settings), color: Colors.black, onPressed: () {})
        ],
      ),
    );
  }

  Widget bottomNavbar() {
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, -3),
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 60,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.black,
                    size: 60,
                  ),
                  label: "Schedule"),
              // BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.add_circle,
              //       color: Colors.red,
              //       size: 100,
              //     ),
              //     label: "Add"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.fact_check_outlined,
                    color: Colors.black,
                    size: 60,
                  ),
                  label: "Timeline"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_pin,
                    color: Colors.black,
                    size: 60,
                  ),
                  label: "Profile"),
            ],
            currentIndex: selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}
