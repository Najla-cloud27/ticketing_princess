import 'package:ticketing_princes/core/constants/variable.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:ticketing_princes/data/datasource/auth_local_datasource.dart';
import 'package:ticketing_princes/data/model/response/category_response_model.dart';

// remote itu method buat handling ennd point

class CategoryRemoteDatasource {
  // pakai future ini karena dia akan melakukan request ke server, jadi dia akan membutuhkan waktu untuk mendapatkan response dari server, jadi kita harus menunggu sampai mendapatkan response dari server, jadi kita menggunakan future untuk menunggu sampai mendapatkan response dari server
  Future<Either<String, CategoryResponseModel>> getCategories() async {
    // disini dia hanya ada satu public function
    // authdata ini buat yang menyi,pan data ketika dia sudah login
    final authData = await AuthLocalDatasource().getAuthData();
    // http itu untuk  keperluan untuk memasukkan url nya url itu pasti kita bikin variable url nya
    // yang pakai method get itu yang isinya headers
    final response = await http.get(
      Uri.parse('${Variable.baseUrl}/api/api-categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(CategoryResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }
}
