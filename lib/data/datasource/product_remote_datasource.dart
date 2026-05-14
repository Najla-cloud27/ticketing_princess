import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:ticketing_princes/core/constants/variable.dart';
import 'package:ticketing_princes/data/datasource/auth_local_datasource.dart';
import 'package:ticketing_princes/data/model/request/create_ticket_request_model.dart';
import 'package:ticketing_princes/data/model/response/create_ticket_response_model.dart';
import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getProduct() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse('${Variable.baseUrl}/api/api-products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  // ini tambah data
  Future<Either<String, CreateTicketResponseModel>> createTicket(
    CreateTicketRequestModel model,
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.put(
      Uri.parse('${Variable.baseUrl}/api/api-products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      },
      body: model.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(CreateTicketResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, CreateTicketResponseModel>> productTicket(
    CreateTicketRequestModel requestModel,
    int id,
  ) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.patch(
      Uri.parse('${Variable.baseUrl}/api/api-products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      },
      body: requestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(CreateTicketResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  // delete
  Future<Either<String, String>> deleteTicket(int id) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.delete(
      Uri.parse('${Variable.baseUrl}/api/api-products/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      },
    );

    if (response.statusCode == 200) {
      return const Right("delete berhasil");
    } else {
      return Left(response.body);
    }
  }
}

/// saat mengirim atau perbarui : post, put, patch => pake body
/// klo delete, get => gapake
