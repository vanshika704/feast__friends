import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      print("Signed in: ${userCredential.user?.uid}");

      Get.snackbar(
        "Success",
        "Signed in successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

      Get.offNamed("/page2");
    } on FirebaseAuthException catch (e) {
      print("Error: $e");

      Get.snackbar(
        "Error",
        "Failed to sign in: ${e.message}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        print("Signed in with Google: ${userCredential.user?.displayName}");

        Get.snackbar(
          "Success",
          "Signed in with Google successfully",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
        Get.offNamed("/page2");
      } else {
        print("Error signing in with Google: Google sign-in account is null");
        Get.snackbar(
          "Error",
          "Failed to sign in with Google: Google sign-in account is null",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      print("Error signing in with Google: $e");
      Get.snackbar(
        "Error",
        "Failed to sign in with Google: $e",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 2, 2),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Image.asset(
                    "assets/logo.png",
                    height: 300,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'Image not found',
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Enter email id',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 248, 202, 116)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 248, 202, 116)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 248, 202, 116)),
                        ),
                      ),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 248, 202, 116)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Enter password',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 248, 202, 116)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 248, 202, 116)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 248, 202, 116)),
                        ),
                      ),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 248, 202, 116)),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
  Get.offNamed("/page2");
},

                  // _signInWithGoogle,

                  icon: const FaIcon(FontAwesomeIcons.google,
                      color: Colors.white),
                  label: const Text('Sign in with Google'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 248, 202, 116),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _signInWithEmailAndPassword,
                  icon: const FaIcon(FontAwesomeIcons.envelope,
                      color: Colors.white),
                  label: const Text('Sign in with Email'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 248, 202, 116),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
