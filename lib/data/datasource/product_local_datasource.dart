// sqflite = local database
// shared_preferences = local storage

// sqflite itu database yang digunakan
// untuk penyimpanan data yang lebih kompleks
// di aplikasi mobile

// shared_preferences cuma menyimpan
// tipe data sederhana seperti:
// int, double, bool, list, dan map

// proses:
// data awal:
// object -> Map<String, dynamic>

// data tersimpan

// ambil data dari sqflite:
// Map<String, dynamic> -> object

import 'package:sqflite/sqflite.dart';
import 'package:ticketing_princes/data/model/request/order_request_model.dart';
import 'package:ticketing_princes/data/model/response/category_response_model.dart';
import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';
import 'package:ticketing_princes/presentation/home/model/order_model.dart';

class ProductLocalDatasource {
  ProductLocalDatasource._init();

  static final ProductLocalDatasource instance = ProductLocalDatasource._init();

  final String tableProduct = 'products';
  final String tableOrder = 'orders';
  final String tableOrderItem = 'order_items';
  final String tableCategories = 'category';

  static Database? _database;

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableProduct(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productId INTEGER,
        category_id INTEGER,
        name TEXT NOT NULL,
        description TEXT,
        price TEXT,
        image TEXT NULL,
        stock INTEGER,
        status INTEGER,
        created_at TEXT,
        updated_at TEXT,
        criteria TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableCategories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        categoryId INTEGER,
        name TEXT NOT NULL,
        description TEXT,
        image TEXT,
        created_at TEXT,
        updated_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableOrder(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nominal INTEGER,
        payment_method TEXT,
        payment_amount INTEGER,
        total_price INTEGER,
        total_item INTEGER,
        cashier_id INTEGER,
        cashier_name INTEGER,
        transction_time TEXT,
        is_sync INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableOrderItem(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_order INTEGER,
        id_product INTEGER,
        quantity INTEGER,
        price INTEGER
      )
    ''');
  }

  // Inisialisasi Database
  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasepath = '$path/ticketing.db';

    return openDatabase(databasepath, version: 1, onCreate: _createDB);
  }

  // Ambil database
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb();
    return _database!;
  }

  // Input semua data produk
  Future<void> insertAllProducts(List<Product> products) async {
    final db = await instance.database;

    for (var product in products) {
      await db.insert(
        tableProduct,
        product.toLocalMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Hapus semua data produk dari database
  Future<void> removeAllProduct() async {
    final db = await instance.database;

    await db.delete(tableProduct);
  }

  // Get data produk
  Future<List<Product>> getAllProducts() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT
        p.*,
        c.id as category_id,
        c.name as category_name,
        c.description as category_description,
        c.image as category_image,
        c.created_at as category_created_at,
        c.updated_at as category_updated_at
      FROM $tableProduct p
      LEFT JOIN $tableCategories c
      ON p.category_id = c.id
    ''');

    return List.generate(maps.length, (index) {
      final productMap = maps[index];

      final categoryMap = {
        'id': productMap['category_id'],
        'name': productMap['category_name'],
        'description': productMap['category_description'],
        'image': productMap['category_image'],
        'created_at': productMap['category_created_at'],
        'updated_at': productMap['category_updated_at'],
      };

      return Product.fromLocalMap(
        productMap,
      ).copyWith(category: Category.fromMap(categoryMap));
    });
  }

  Future<int> insertOrder(OrderModel order) async {
    final db = await instance.database;

    int id = await db.insert(
      tableOrder,
      order.toMapForLocal(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (var orderItem in order.orders) {
      await db.insert(
        tableOrderItem,
        orderItem.toMapForLocal(id),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    return id;
  }

  Future<List<OrderModel>> getAllOrder() async {
    final db = await instance.database;

    final result = await db.query(tableOrder, orderBy: 'id DESC');

    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  // Ambil data order kalau gagal sync ke server
  Future<List<OrderModel>> getOrdersIsSyncFalse() async {
    final db = await instance.database;

    final result = await db.query(tableOrder, where: 'is_sync = 0');

    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  // Update data order
  Future<void> updateOrderIsSync(int id) async {
    final db = await instance.database;

    await db.update(
      tableOrder,
      {'is_sync': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Get order item berdasarkan id order
  Future<List<OrderItemModel>> getOrderItemsByIdOrder(int idOrder) async {
    final db = await instance.database;

    final result = await db.query(
      tableOrderItem,
      where: 'id_order = ?',
      whereArgs: [idOrder],
    );

    return result.map((e) => OrderItemModel.fromMap(e)).toList();
  }

  Future<void> insertAllCategory(List<Category> categories) async {
    final db = await instance.database;

    for (var category in categories) {
      await db.insert(
        tableCategories,
        category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> removeAllCategory() async {
    final db = await instance.database;

    await db.delete(tableCategories);
  }
}
