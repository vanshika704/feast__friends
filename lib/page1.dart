import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              children: [
                Image.asset(
                  "assets/logo.png",
                  height: 50,
                  width: 50,
                )
              ],
            )),
        body: Row(
          children: [],
        ));
  }
}
