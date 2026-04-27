import 'package:ticketing_princes/core/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/presentation/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),

      // pushReplacement = buat ganti halaman, jadi user ga bisa balik ke splash screen lagi
      () => context.pushReplacement(LoginPage()),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Assets.images.logoBlue.image()),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Align(alignment: Alignment.center),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  Future.delayed(
    Duration(seconds: 2),
    () => context.pushReplacement(LoginPage()),
  );

  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/splash.png', width: 200, height: 200),
          const SizedBox(height: 20),
          const Text(
            'Ticketing Princes',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
