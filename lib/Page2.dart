import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                height: 65,
                width: 55,
              ),
              const SizedBox(width: 3),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: TabBar(
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: GoogleFonts.dmSerifText(
                      textStyle: const TextStyle(
                    color: Color.fromARGB(255, 252, 221, 85),
                  )),
                  unselectedLabelStyle: GoogleFonts.dmSerifText(
                      textStyle: const TextStyle(
                    color: Color.fromARGB(255, 253, 253, 253),
                  )),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  indicator: const BoxDecoration(),
                  tabs: const [
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
                  Stack(
                    children: [
                      Image.asset(
                        'assets/food7.jpg',
                        fit: BoxFit.cover,
                        height: 300,
                        width: 500,
                      ),
                      Positioned(
                        top: 80,
                        left: 50,
                        child: Text(
                          "Life is too Short for \n     Boring food",
                          style: GoogleFonts.dmSerifText(
                              textStyle: const TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 247, 244, 244),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                // exxplore page
                children: [
                  Text('Explore',
                      style: GoogleFonts.dmSerifText(
                          textStyle: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ))),
                ],
              ),
              Column(
                //  partner page
                children: [
                  Text('Partner',
                      style: GoogleFonts.dmSerifText(
                          textStyle: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ))),
                ],
              ),
              Column(
                // About
                children: [
                  Text('About',
                      style: GoogleFonts.dmSerifText(
                          textStyle: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
