import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/assets/assets.gen.dart';
import 'package:ticketing_princes/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:ticketing_princes/presentation/auth/pages/login.dart';
import 'package:ticketing_princes/presentation/home/dialog/logout_dialog.dart';
import 'package:ticketing_princes/presentation/home/dialog/sync_dialog.dart';
import 'package:ticketing_princes/presentation/home/widget/setting_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(24),
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
        children: [
          SettingButton(
            iconPath: Assets.icons.settings.printer.path,
            title: 'Printer',
            subtitle: 'Kelola Printer',
            onPressed: () {},
          ),
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              // ini buat biar kita ga nulis kondisi di semua state
              // pakai maybeWhen buat ngehandle semua kondisi supaya tidak harus nulis kondisi untuk loading, error, success, dll
              state.maybeWhen(
                success: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                orElse: () {},
              );
            },
            child: SettingButton(
              iconPath: Assets.icons.settings.logout.path,
              title: 'Logout',
              subtitle: 'Keluar dari akun',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => LogoutDialog(),
                );
              },
            ),
          ),
          SettingButton(
            iconPath: Assets.icons.settings.syncData.path,
            title: 'Sync Category',
            subtitle: 'Sinkronkan data Kategori',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SyncDataDialog(),
              );
            },
          ),
          SettingButton(
            iconPath: Assets.icons.settings.syncData.path,
            title: 'Sync Produk',
            subtitle: 'Sinkronkan data Produk',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SyncDataDialog(),
              );
            },
          ),
          SettingButton(
            iconPath: Assets.icons.settings.syncData.path,
            title: 'Sync Order',
            subtitle: 'Sinkronkan data Order',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SyncDataDialog(),
              );
            },
          ),
          SettingButton(
            iconPath: Assets.icons.settings.printer.path,
            title: 'Profile',
            subtitle: 'Kelola Profile',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
