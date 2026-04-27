class HistoryModel {
  final String name;
  final int price;
  final DateTime dateTime;

  // Buat constructor untuk menginisialisasi semua field
  HistoryModel({
    required this.name,
    required this.price,
    required this.dateTime,
  });
}

List<HistoryModel> histories = [
  HistoryModel(
    name: 'Bus A',
    price: 50000,
    dateTime: DateTime(2024, 6, 1, 10, 30),
  ),
  HistoryModel(
    name: 'Bus B',
    price: 75000,
    dateTime: DateTime(2024, 6, 2, 14, 45),
  ),
  HistoryModel(
    name: 'Bus C',
    price: 60000,
    dateTime: DateTime(2024, 6, 3, 9, 15),
  ),
  HistoryModel(
    name: 'Waterpark',
    price: 70000,
    dateTime: DateTime(2024, 6, 3, 9, 18),
  ),
  HistoryModel(
    name: 'Waterboom',
    price: 850000,
    dateTime: DateTime(2024, 6, 3, 9, 25),
  ),
];
