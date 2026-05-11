import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/assets/assets.gen.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_princes/data/datasource/auth_local_datasource.dart';
import 'package:ticketing_princes/presentation/auth/bloc/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SizedBox(
            height: 260,
            child: Center(child: Assets.images.logoBlue.image(height: 200)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 44,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: emailController,
                        label: 'Email',
                      ),
                      SpaceHeight(36),
                      CustomTextField(
                        controller: passwordController,
                        label: 'Password',
                        obscureText: true,
                      ),
                      SpaceHeight(84),
                      // bloclistener itu buat dengerin perubahan state dari bloc, kalo ada perubaham state dia bakal jalanin fungsi yang kita masukin ke listener
                      // biasanya dipakai untuk aksi sekali jalan dan tidak handling perubhan ui, kayak pindah halaman, tampilkan snackbar, dialog, simpan ke token ke penyimpanan lokal,dll
                      BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            success: (data) async {
                              await AuthLocalDatasource().saveAuthData(data);
                            },
                            error: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(error),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                          );
                        },
                        // bloc builder ini untuk membangun ui berdasarkan state dari bloc
                        // jadi kalau state berubah, dia bakal bangun ulang tampilan
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return Button.filled(
                                  onPressed: () {
                                    context.read<LoginBloc>().add(
                                      LoginEvent.login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  },
                                  label: 'login',
                                );
                              },
                              loading: () =>
                                  Center(child: CircularProgressIndicator()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
