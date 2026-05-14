import 'dart:convert';

class OrderRequestModel {
  final String? transactionTime;
  final int? cashierId;
  final int? totalPrice;
  final int? totalItem;
  final String? paymentMethod;
  final int? paymentAmount;
  final String? cashierName;

  final List<OrderItemModel>? orderItems;

  OrderRequestModel({
    this.transactionTime,
    this.cashierId,
    this.totalPrice,
    this.totalItem,
    this.paymentMethod,
    this.paymentAmount,
    this.cashierName,
    this.orderItems,
  });

  factory OrderRequestModel.fromJson(String str) =>
      OrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRequestModel.fromMap(Map<String, dynamic> json) =>
      OrderRequestModel(
        transactionTime: json["transaction_time"],
        cashierId: json["total_price"],
        totalPrice: json["total_price"],
        totalItem: json["total_item"],
        paymentMethod: json["payment_method"],
        paymentAmount: json["payment_amount"],
        cashierName: json["cashier_name"],
        orderItems: json["order_items"] == null
            ? []
            : List<OrderItemModel>.from(
                json["order_items"]!.map((x) => OrderItemModel.fromMap(x)),
              ),
      );

  Map<String, dynamic> toMap() {
    // Validate required fields
    if (transactionTime == null || transactionTime!.isEmpty) {
      throw Exception('transaction_time is required');
    }
    if (cashierId == null) {
      throw Exception('cashier_id is required');
    }
    if (totalPrice == null) {
      throw Exception('total_price is required');
    }

    return {
      "transaction_time": transactionTime,
      "cashier_id": cashierId,
      "total_price": totalPrice,
      "total_item": totalItem,
      "payment_method": paymentMethod,
      "payment_amount": paymentAmount,
      "cashier_name": cashierName,
      "order_items": orderItems?.map((item) => item.toMap()).toList(),
    };
  }
}

class OrderItemModel {
  final int? productId;
  final int? quantity;
  final int? totalPrice;

  OrderItemModel({this.productId, this.quantity, this.totalPrice});

  factory OrderItemModel.fromJson(String str) =>
      OrderItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItemModel.fromMap(Map<String, dynamic> json) => OrderItemModel(
    productId: json["id_product"],
    quantity: json["quantity"],
    totalPrice: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "product_id": productId,
    "quantity": quantity,
    "total_price": totalPrice,
  };
}
