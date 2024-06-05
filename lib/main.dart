import 'package:feast__friends/Page2.dart';
import 'package:feast__friends/page1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Feast Friends',
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? "/LoginPage" : "/page2",
      getPages: [
        GetPage(name: "/LoginPage", page: () => const LoginPage()),
        GetPage(name: "/page1", page: () => const Page1()),
        GetPage(name: "/page2", page: () => const MainPage()),
      ],
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 5, 5)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
