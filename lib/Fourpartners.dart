import 'package:flutter/material.dart';

class FourPartners extends StatefulWidget {
  const FourPartners({super.key});

  @override
  State<FourPartners> createState() => _FourPartnersState();
}

class _FourPartnersState extends State<FourPartners> {
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
              "Find Partners",
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
