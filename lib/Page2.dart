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

  void _onOrderTap() {
    // Perform action for the order container
    print('Order tapped');
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
                    ),
                  ),
                  unselectedLabelStyle: GoogleFonts.dmSerifText(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253),
                    ),
                  ),
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
              SingleChildScrollView(
                child: Column(
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
                              ),
                            ),
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
                              onTap: _onExploreTap, // Function reference
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
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Explore',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: _onFindPartnerTap, // Function reference
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
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.people,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Find Partner',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: _onOrderTap, // Function reference
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.white,
                                      width: 3.0,
                                    ),
                                  ),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.fastfood,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Order',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16), // Adjust the value for more/less curvature
    // Optionally, you can also add a border:
    // border: Border.all(
    //   color: Color.fromARGB(255, 94, 93, 93),
    //   width: 2,
    // ),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16), // Match the same radius as in BoxDecoration
    child: Image.asset(
      "assets/pic2.png",
      height: 150,
      width: 180,
      fit: BoxFit.cover, // Ensures the image fits nicely within the curved edges
    ),
  ),
),

                        SizedBox(
                            width:
                                20), // Adjust the width as needed for spacing
                        Text(
                          "A Good Meal\n  is All You\n      Need..",
                          style: GoogleFonts.dmSerifText(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 247, 244, 244),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SingleChildScrollView(
                child: Column(
                  // explore page
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SingleChildScrollView(
                child: Column(
                  // partner page
                  children: [
                    Text(
                      'Partner',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SingleChildScrollView(
                child: Column(
                  // about page
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
