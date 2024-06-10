import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

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
          toolbarHeight: 80.0, // Adjust the height of the AppBar
          title: Row(
            children: [
              Image.asset(
                "assets/logo.png",
                height: 50, // Adjust the logo size
                width: 45,
              ),
              const SizedBox(
                  width: 10), // Add some spacing between logo and tabs
              const Flexible(
                child: TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
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
        body: const TabBarView(
          children: [
            Center(child: Text('Home', style: TextStyle(fontSize: 24))),
            Center(child: Text('Explore', style: TextStyle(fontSize: 24))),
            Center(child: Text('Partner', style: TextStyle(fontSize: 24))),
            Center(child: Text('About', style: TextStyle(fontSize: 24))),
          ],
        ),
      ),
    );
  }
}
