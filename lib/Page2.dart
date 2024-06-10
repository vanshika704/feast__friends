import 'dart:ui'; // Add this line

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          toolbarHeight: 60.0,
          title: Row(
            children: [
              Image.asset(
                "assets/logo.png",
                height: 50,
                width: 40,
              ),
              const SizedBox(width: 3),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: const TabBar(
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Color.fromARGB(255, 252, 221, 85),
                  unselectedLabelColor: Color.fromARGB(255, 253, 253, 253),
                  labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  indicator: BoxDecoration(),
                  tabs: [
                    Tab(text: 'Home'),
                    Tab(text: 'Explore'),
                    Tab(text: 'Partner'),
                    Tab(text: 'About'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.black,
          child: TabBarView(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/food1.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Explore',
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                ],
              ),
              Column(
                children: [
                  Text('Partner',
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                ],
              ),
              Column(
                children: [
                  Text('About',
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
