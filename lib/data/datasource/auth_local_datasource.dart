// buat handle sesuatu yang disimpan di penyimpanan local hp kyak token, data user, dll
// Disini penyimpanan lokal pake shared preferences, tapi juga bisa pake yang lain seperti Hive, Soflite, dll
// Shared prefrences, tapi juga pake yang lain seperti hive, sqflite, dll
// Shared prefrences =? penyimpanan lokal di hp atau penyimpanan data kecil(token, sesi login. dll)
// sifatnya presisten (data tetap ada walaupun aplikasi ditutup)

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketing_princes/data/model/response/auth_response_model.dart';

class AuthLocalDatasource {
  // ini untuk menyimpan data autentikasi/buat simpan data login
  Future<void> saveAuthData(AuthResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', data.toJson());
  }

  // Remove data yang login
  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  // Ambil data yang login
  Future<AuthResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('auth_data');
    if (data != null) {
      return AuthResponseModel.fromJson(data);
    } else {
      throw Exception('Data auth tidak ditemukan');
    }
  }

  // Cek aopakah data  user udah login atau belum
  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey('auth_data');
  }
}
