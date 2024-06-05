import 'package:flutter/material.dart';

class EatingTrio extends StatefulWidget {
  const EatingTrio({super.key});

  @override
  State<EatingTrio> createState() => _EatingTrioState();
}

class _EatingTrioState extends State<EatingTrio> {
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
              "Dine Partner...",
              style: TextStyle(
                  color: Color.fromARGB(255, 248, 202, 116),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
