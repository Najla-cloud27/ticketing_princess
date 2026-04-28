import 'package:ticketing_princes/presentation/home/model/product_model.dart';

class OrderModel {
  final ProductModel product;
  int quantity;
  OrderModel({required this.product, required this.quantity});
}

List<OrderModel> orders = [
  OrderModel(product: produks[0], quantity: 2),
  OrderModel(product: produks[1], quantity: 1),
  OrderModel(product: produks[2], quantity: 3),
];
