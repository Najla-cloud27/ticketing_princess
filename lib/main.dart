import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/data/datasource/auth_remote_datasource.dart';
import 'package:ticketing_princes/data/datasource/category_remote_datasource.dart';
import 'package:ticketing_princes/data/datasource/order_remote_datasource.dart';
import 'package:ticketing_princes/data/datasource/product_local_datasource.dart';
import 'package:ticketing_princes/data/datasource/product_remote_datasource.dart';
import 'package:ticketing_princes/presentation/auth/bloc/login/login_bloc.dart';
import 'package:ticketing_princes/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:ticketing_princes/presentation/auth/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketing_princes/presentation/home/bloc/category/category_bloc.dart';
import 'package:ticketing_princes/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:ticketing_princes/presentation/home/bloc/history/history_bloc.dart';
import 'package:ticketing_princes/presentation/home/bloc/order/order_bloc.dart';
import 'package:ticketing_princes/presentation/home/bloc/product/product_bloc.dart';
import 'package:ticketing_princes/presentation/home/bloc/sync_order/sync_order_bloc.dart';

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
        BlocProvider(create: (context) => LogoutBloc(AuthRemoteDatasource())),
        BlocProvider(
          create: (context) => ProductBloc(
            ProductRemoteDatasource(),
            ProductLocalDatasource.instance,
          )..add(ProductEvent.syncProducts()),
        ),
        BlocProvider(create: (context) => CheckoutBloc()),
        BlocProvider(create: (context) => OrderBloc()),
        BlocProvider(
          create: (context) => HistoryBloc(ProductLocalDatasource.instance),
        ),
        BlocProvider(
          create: (context) => SyncOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(CategoryRemoteDatasource()),
        ),
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
