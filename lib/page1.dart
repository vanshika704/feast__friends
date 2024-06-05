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
              height: 60,
              width: 60,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "Choose Way..",
              style: TextStyle(
                  color: Color.fromARGB(255, 248, 202, 116),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: GridView.builder(
          padding: const EdgeInsets.all(50.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10.0,
            childAspectRatio: 4 / 1,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              color: const Color.fromARGB(255, 248, 202, 116),
              margin: const EdgeInsets.symmetric(vertical: 3.0),
            );
          },
        ),
      ),
    );
  }
}
