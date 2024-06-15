import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _onExploreTap() {
    // Navigate to Explore page or perform action
    print('Explore tapped');
  }

  void _onFindPartnerTap() {
    // Navigate to Find Partner page or perform action
    print('Find Partner tapped');
  }

  void _onThirdContainerTap() {
    // Perform action for the third container
    print('Third container tapped');
  }

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
                  Container(
                    width: 400,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(207, 83, 83, 83),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: _onExploreTap,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                  right: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Explore',
                                    style: GoogleFonts.dmSerifText(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: _onFindPartnerTap,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                  right: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.people,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Find Partner',
                                    style: GoogleFonts.dmSerifText(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: _onThirdContainerTap,
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                // explore page
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
                // partner page
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
                // about page
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
