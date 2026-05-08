import 'package:ticketing_princes/core/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/data/datasource/auth_local_datasource.dart';
import 'package:ticketing_princes/presentation/auth/pages/login.dart';
import 'package:ticketing_princes/presentation/home/pages/main_page.dart';

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
      // pushreplacement to login page = itu menghapus halaman splash screem daro stack dan menggantinya dengan hlaman login
      () => context.pushReplacement(LoginPage()),
    );

    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 3),
          () => AuthLocalDatasource().isLogin(),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return MainPage();
            } else {
              return LoginPage();
            }
          }

          return Stack(
            children: [
              Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(80),
                    child: Center(
                      child: Assets.images.logoBlue.image(height: 200),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Najla Ticketing',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                  SpaceHeight(40),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
