import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<String>> futureFoodImages;

  @override
  void initState() {
    super.initState();
    futureFoodImages = fetchFoodImages();
  }

  Future<List<String>> fetchFoodImages() async {
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/random?query=food&count=170&client_id=-SXu-p1sLlhOb9e6jqiKCfP46WmqjCl3DeGLt_L2-tw'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<String> images = [];
      for (final item in data) {
        final imageUrl = item['urls']['regular'];
        images.add(imageUrl);
      }
      return images;
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
      body: FutureBuilder<List<String>>(
        future: futureFoodImages,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load images'),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: snapshot.data!
                    .map((imageUrl) => _buildCard(imageUrl))
                    .toList(),
              ),
            );
          } else {
            return Center(
              child: Text('No images found'),
            );
          }
        },
      ),
    );
  }

  Widget _buildCard(String imageUrl) {
    return Card(
      color: Color.fromARGB(109, 7, 7, 7),
      child: InkWell(
        onTap: () {
          print('Card tapped: $imageUrl');
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: imageUrl.isNotEmpty
              ? Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
