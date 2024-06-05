import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              "Welcome",
              style: TextStyle(
                color: Color.fromARGB(255, 248, 202, 116),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black, // Set background color of Scaffold
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            _buildCard('assets/logo.png', 'Profile 1'),
            _buildCard('assets/logo.png', 'Profile 2'),
            _buildCard('assets/logo.png', 'Profile 3'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String imagePath, String text) {
    return Card(
      color: Colors.grey[300],
      child: InkWell(
        onTap: () {
          // Handle card tap
          print('Card tapped: $text');
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  imagePath,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
