class ProductModel {
  final String name;
  final String typeProduk;
  final int hargaPorduk;
  int quantity;

  ProductModel({
    required this.name,
    required this.typeProduk,
    required this.hargaPorduk,
    this.quantity = 1,
  });
}

// bikin objek nya
final produks = [
  ProductModel(name: 'Bus A', typeProduk: 'Bus', hargaPorduk: 50000),
  ProductModel(name: 'Bus B', typeProduk: 'Bus', hargaPorduk: 75000),
  ProductModel(name: 'Bus C', typeProduk: 'Bus', hargaPorduk: 60000),
  ProductModel(name: 'Waterpark', typeProduk: 'Waterpark', hargaPorduk: 70000),
  ProductModel(name: 'Waterboom', typeProduk: 'Waterpark', hargaPorduk: 850000),
];
