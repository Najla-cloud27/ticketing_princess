class ProductModel {
  final String namaProduk;
  final String typeProduk;
  final int hargaProduk;
  int quantity;

  ProductModel({
    required this.namaProduk,
    required this.typeProduk,
    required this.hargaProduk,
    this.quantity = 1,
  });
}

// bikin objek nya
final produks = [
  ProductModel(namaProduk: 'Bus A', typeProduk: 'Bus', hargaProduk: 50000),
  ProductModel(namaProduk: 'Bus B', typeProduk: 'Bus', hargaProduk: 75000),
  ProductModel(namaProduk: 'Bus C', typeProduk: 'Bus', hargaProduk: 60000),
  ProductModel(
    namaProduk: 'Waterpark',
    typeProduk: 'Waterpark',
    hargaProduk: 70000,
  ),
  ProductModel(
    namaProduk: 'Waterboom',
    typeProduk: 'Waterpark',
    hargaProduk: 850000,
  ),
];
