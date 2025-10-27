import 'package:flutter/material.dart';
import 'package:ppkd_b4_sofyan/day18/tampilan_login.dart';
import 'package:ppkd_b4_sofyan/login/home_screen.dart';

class PreferenceHandler {
  // Temporary/simple implementation — replace with your real preferences logic.
  // This returns a Future<bool?> matching how your code expects to use it.
  static Future<bool?> getLogin() async {
    // Example: default to false (not logged in). Replace to read from storage.
    return Future.value(false);
  }
}

class SplashScreenDay18 extends StatefulWidget {
  const SplashScreenDay18({super.key});

  @override
  State<SplashScreenDay18> createState() => _SplashScreenDay18State();
}

class _SplashScreenDay18State extends State<SplashScreenDay18> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    var isLogin = await PreferenceHandler.getLogin();
    print(isLogin);
    if (isLogin != null && isLogin == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginDay13()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/buah.jpg')),
          const SizedBox(height: 16),
          const Text(
            "Apel Apps",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
