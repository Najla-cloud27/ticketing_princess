import 'dart:convert';

import 'package:ticketing_princes/data/model/response/category_response_model.dart';

class ProductResponseModel {
  final String? status;
  final List<Product>? data;

  ProductResponseModel({this.status, this.data});

  factory ProductResponseModel.fromJson(String str) =>
      ProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Product {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final int? stock;
  final int? categoryId;
  final String? status;
  final String? criteria;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Category? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.categoryId,
    this.status,
    this.criteria,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    stock: json["stock"],
    categoryId: json["category_id"],

    // status: json["status"],
    status: json["status"],
    criteria: json["criteria"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    category: json["category"] == null
        ? null
        : Category.fromMap(json["category"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stock": stock,
    "category_id": categoryId,
    "status": status,
    "criteria": criteria,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "category": category?.toMap(),
  };

  factory Product.fromLocalMap(Map<String, dynamic> json) => Product(
    id: json["productId"],
    name: json["name"],
    description: json["description"],
    price: json["price"] is String
        ? int.tryParse(json["price"])
        : json["price"],
    stock: json["stock"],
    categoryId: json["category_id"],
    status: json["status"],
    criteria: json["criteria"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    category: json["category"] == null
        ? null
        : Category.fromMap(json["category"]),
  );

  Map<String, dynamic> toLocalMap() => {};

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.stock == stock &&
        other.categoryId == categoryId &&
        other.status == status &&
        other.criteria == criteria &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        stock.hashCode ^
        categoryId.hashCode ^
        status.hashCode ^
        criteria.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        category.hashCode;
  }

  Product copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
    int? stock,
    int? categoryId,
    String? status,
    String? criteria,
    DateTime? createdAt,
    DateTime? updatedAt,
    Category? category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      categoryId: categoryId ?? this.categoryId,
      status: status ?? this.status,
      criteria: criteria ?? this.criteria,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
    );
  }
}
