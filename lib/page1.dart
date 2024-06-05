import 'package:feast__friends/Eating%20duo.dart';
import 'package:feast__friends/Eatingquadrates.dart';
import 'package:feast__friends/Eatingtrio.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final List<String> gridTexts = [
    "Eating Pair",
    "Dining Trio",
    "Dining Quartet",
    "Four Dining Companions",
  ];

  void _onGridItemTap(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const EatingDuo();
        break;
      case 1:
        page = const EatingTrio();
        break;
      case 2:
        page = const EatingQuadrates();
        break;

      default:
        return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Image.asset(
              "assets/logo.png",
              height: 60,
              width: 60,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "Dine Partners",
              style: TextStyle(
                  color: Color.fromARGB(255, 248, 202, 116),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/Untitled design (12).png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0),
            child: Center(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(50.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 4 / 1,
                ),
                itemCount: gridTexts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => _onGridItemTap(context, index),
                    child: Container(
                      alignment: Alignment.center,
                      color: const Color.fromARGB(255, 248, 202, 116),
                      margin: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        gridTexts[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
