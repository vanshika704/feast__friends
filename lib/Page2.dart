import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> foodImages = [];

  @override
  void initState() {
    super.initState();
    fetchFoodImages();
  }

  Future<void> fetchFoodImages() async {
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/random?query=food&count=3&client_id=-SXu-p1sLlhOb9e6jqiKCfP46WmqjCl3DeGLt_L2-tw'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<String> images = [];
      for (final item in data) {
        final imageUrl = item['urls']['regular'];
        images.add(imageUrl);
      }
      setState(() {
        foodImages = images;
      });
    } else {
      throw Exception('Failed to load images');
    }
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
            SizedBox(
              width: 20,
            ),
            Text(
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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            _buildCard(foodImages.isNotEmpty ? foodImages[0] : ''),
            _buildCard(foodImages.isNotEmpty ? foodImages[1] : ''),
            _buildCard(foodImages.isNotEmpty ? foodImages[2] : ''),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String imageUrl) {
    return Card(
      color: const Color.fromARGB(110, 224, 224, 224),
      child: InkWell(
        onTap: () {
          print('Card tapped: $imageUrl');
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: imageUrl.isNotEmpty
              ? Container(
                  height: 200, // Adjust height as needed
                  width: 200, // Adjust width as needed
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                )
              : Container(), // Return an empty container if imageUrl is empty
        ),
      ),
    );
  }
}
