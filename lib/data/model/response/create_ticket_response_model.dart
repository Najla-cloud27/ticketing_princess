import 'dart:convert';

import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';

class CreateTicketResponseModel {
  final String status;
  final dynamic data;

  CreateTicketResponseModel({required this.status, required this.data});

  factory CreateTicketResponseModel.fromJson(String str) =>
      CreateTicketResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateTicketResponseModel.fromMap(Map<String, dynamic> json) =>
      CreateTicketResponseModel(
        status: json["status"],
        data: Product.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {"status": status, "data": data.toMap()};
}
