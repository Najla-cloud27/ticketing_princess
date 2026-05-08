import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/data/datasource/auth_remote_datasource.dart';
import 'package:ticketing_princes/presentation/auth/bloc/login/login_bloc.dart';
import 'package:ticketing_princes/presentation/auth/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(AuthRemoteDatasource())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ticketing Princes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.outfitTextTheme(),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.outfit(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: const IconThemeData(color: AppColors.black),
            centerTitle: true,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
