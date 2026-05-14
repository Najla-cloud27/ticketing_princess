import 'package:http/http.dart' as http;
import 'package:ticketing_princes/core/constants/variable.dart';
import 'package:ticketing_princes/data/datasource/auth_local_datasource.dart';
import 'package:ticketing_princes/data/model/request/order_request_model.dart';

class OrderRemoteDatasource {
  Future<bool> sendOrder(OrderRequestModel orderRequest) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.post(
      Uri.parse('${Variable.baseUrl}/api-api-orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      },
      body: orderRequest.toJson(),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print(
        'Erros sata mengirim order: ${response.statusCode} - ${response.body}',
      );
      return false;
    }
  }
}
