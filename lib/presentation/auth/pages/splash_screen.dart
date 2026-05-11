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
    return Scaffold(
      body: FutureBuilder(
        // FutureBuilder itu widget yang bisa membangun tampilan
        // berdasarkan hasil dri sebuah future, jadi dia bakal nungguin future selesai,
        // terus dia bakal bangun tampilan sesuai dengan hasilnya
        future: Future.delayed(
          Duration(seconds: 3),
          () => AuthLocalDatasource().isLogin(),
        ),
        builder: (context, snapshot) {
          // snapshot itu hasil dari future
          // snapshot laporan hasil dari pengecekan apakah user uda login atau belum
          // jadi bisa di isi hasil apakah proses nya masih loading atau sudah selesai
          // dtanya seperti apa atau errornya seperti apa ?
          if (snapshot.connectionState == ConnectionState.done) {
            // snapshot.connectionstate itu buat cek status future
            // snapshot.data itu hasil dari future, isinya true atau false
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
                    'Ticketing Princess',
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
