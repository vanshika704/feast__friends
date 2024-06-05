import 'package:flutter/material.dart';

class EatingDuo extends StatefulWidget {
  const EatingDuo({super.key});

  @override
  State<EatingDuo> createState() => _EatingDuoState();
}

class _EatingDuoState extends State<EatingDuo> {
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
              "Find A Partner",
              style: TextStyle(
                  color: Color.fromARGB(255, 248, 202, 116),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
