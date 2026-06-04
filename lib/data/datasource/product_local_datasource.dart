// sqflite => local database
// shared_preferences => local storage

// sqflite itu database yang digunakan untuk penyimpanan data yang lebih kompleks
// di penyimpanan aplikasi mobile
// cuma nyimpen tipe data yang sederhana aja, kayak string, int, double, bool,
// list, map

// Proses nya :
// data awal : objek -> Map<String, dynamic>
// data tersimpan
// Ambil data dari sqflite : Map<String, dynamic> -> objek

import 'package:sqflite/sqflite.dart';
import 'package:ticketing_princes/data/model/request/order_request_model.dart';
import 'package:ticketing_princes/data/model/response/category_response_model.dart';
import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';
import 'package:ticketing_princes/presentation/home/model/order_model.dart';

// Buat akses data di lokal, bikin database, ambi data dari database lokal sqflite
class ProductLocalDatasource {
  // Sama kayak kita bikin kantor pusat
  // Ini dilakukan, biar kalau orang mau akses product local datasource itu ga
  // bikin objek berkali kali

  // Atau gampang nya,
  // kita bikin 1 kantor pusat
  // kalo orang mau akses kantor pusat, dia langsung akses kantor pusat itu

  // Jadi kalau butuh data, ya dateng aja ke kantor pusat, gausah bikin kantor pusat
  // sendiri sendiri

  // Ini namanya Singleton Pattern => objek utama yang bakal dipakai di seluruh aplikasi
  // Jadi setiap kita mau akses datanya, ga perlu bikin objek baru

  // Bikin kantor pusat
  ProductLocalDatasource._init();

  //
  static final ProductLocalDatasource instance = ProductLocalDatasource._init();

  final String tableProduct = 'products';
  final String tableOrder = 'orders';
  final String tableOrderItem = 'order_items';
  final String tableCategories = 'category';

  // Kalau database nya ga ada maka buat database baru
  static Database? _database;
  // _database itu buat nyimpen objek database, karena pas awal buka aplikasi
  // Kita misalnya ga yakin database nya ada, maka kita bikin objek database baru

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE $tableProduct (
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
 CREATE TABLE $tableCategories (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       categoryId INTEGER,
       name TEXT NOT NULL,
       description TEXT,
       image TEXT,
       created_at TEXT,
       updated_at TEXT)
''');

    await db.execute('''
       CREATE TABLE $tableOrder (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       nominal INTEGER,
       payment_method TEXT,
       payment_amount INTEGER,
       total_price INTEGER,
       total_item INTEGER,
       cashier_id INTEGER,
       cashier_name TEXT,
       transaction_time TEXT,
       is_sync INTEGER DEFAULT 0
)''');
    await db.execute('''
       CREATE TABLE $tableOrderItem (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       id_order INTEGER,
       id_product INTEGER,
       quantity INTEGER,
       price INTEGER
       )
       ''');
  }

  // Inisialisasi Database
  // buat cari lokasi penyimpanan database lalu membuka atau membuat database
  Future<Database> _initDb() async {
    // getDatabasesPath itu dipakai buat ambil lokasi folder database di HP
    final path = await getDatabasesPath();
    // ini variable buat lokasi penyimpanan database
    // Jadi nanti database kita disimpan dengan nama ticketing4.db
    final databasepath = '$path/ticketing4.db';

    // openDatabase dipakai buat membuka database
    // Kalau database belum ada sqflite bakal bikin baru,
    // version 1 artinya versi database
    // onCreate  dipakai kalau database baru dibuat, maka jalankan function _createDB
    // untuk membuat tabel tabelnya
    return openDatabase(databasepath, version: 1, onCreate: _createDB);
  }

  // Ambil database
  // Ini getter untuk ambil database, jadi nanti kalau butuh database, tinggal panggil
  // instance.database
  Future<Database> get database async {
    // kalau database sudah ada, langsung pakai database yang ada
    // ada ! karena kita udah yakin kalau database nya ada, soalnya kan udah di cek
    if (_database != null) return _database!;
    // Kalau ternyata database nya masih null, maka buat atau buka dulu database nya
    // lewat _initDb
    _database = await _initDb();
    // setelah dbuat atau dibuka, tinggal di kembalikan aja pake return
    return _database!;
  }

  // Input semua data produk ke database
  // Ini buat simpen data produk ke database dalam bentuk List produk dari API
  Future<void> insertAllProducts(List<Product> products) async {
    // mengambil database dulu
    final db = await instance.database;
    // data di loop satu per satu
    for (var product in products) {
      // masukin data pake keyword insert,
      // Karena buat produk, berarti masukinnya ke table produk
      // toLocalMap itu artinya, ubah produk dari API kan bentuk nya objek,
      // diubah jadi Map<String, dynamic>
      // Kenapa? kareana sqflite kan  nyimpen data bentuknya map
      await db.insert(
        tableProduct,
        product.toLocalMap(),
        // Kalau data yang diinput nanti ternyata ada konflik,
        // maka data lama bakal diganti dengan data baru
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Hapus semua data produk dari database
  Future<void> removeAllProduct() async {
    // akses atau ambil database
    final db = await instance.database;
    // Langsung hapus semua data di tabel produk soalnya gapake where
    await db.delete(tableProduct);
  }

  // Get data product
  Future<List<Product>> getAllProducts() async {
    // ambil database
    final db = await instance.database;
    // rawQuesry itu cuma buat menulis sql query manual
    // Querynya buat ambil data dari tabel produk dan kategory sekaligus
    // p buat produk
    // c buat category
    // p* buat ambil semua data produk
    // Ini namnya left join untuk gabungin data produk dan category
    // dibagian ON itu buat mencocokkan data produk dengan data kategori berdasarkan
    // category_id
    // Karena pakau left join, semua data produk tetap diambil,
    //data kategori yang ga ada di produk, bakal null
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
SELECT p.*, c.id as category_id, c.name as category_name,
 c.description as category_description,
c.image as category_image, c.created_at as category_created_at,
 c.updated_at as category_updated_at
FROM $tableProduct p
      LEFT JOIN $tableCategories c ON p.category_id = c.id
''');

    // Ini dipakai buat membuat List<product> dari data map hasil query
    return List.generate(maps.length, (index) {
      // ambil data produk hasil query (bentuknya Map<String, dynamic>)
      final productMap = maps[index];
      // buat bikin map khusus kategori
      // jadi kan hasil query itu gabungan produk dan kategori
      // jadi nanti data kategori nya dipisahkan dulu ke categoryMap, baru nanti diubah jadi
      // objek category
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
          ) //ubah data map menjadi objek produk
          .copyWith(
            category: //membuat salinan produk, tapi categorynya diisi dengan objek
            Category.fromMap(
              categoryMap,
            ),
          ); //mengubah map kategori jadi objek kategori
      //  Hasil akhirnya, produk udahh punya kategori
    });
  }

  // Buat nyimpen data order ke database lokal, hasilnya nanti bakal mengembalikan
  //id order yang baru dibuat
  //
  Future<int> insertOrder(OrderModel order) async {
    final db = await instance.database;
    // mengubah data objek order jadi map
    int id = await db.insert(
      tableOrder,
      order.toMapForLocal(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // loop semua item yang ada di order
    // misal di 1 transaski ada beberapa produk, maka setiap produk bakal di simpan ke
    // table order item
    for (var orderItem in order.orders) {
      // simpen ke table order item
      // diubah dulu jadi map
      // id order dikirim supaya order item tau dia punya nya id order yang mana
      // jadi id order utama itu disimpan sebagai id order di tabel order items
      await db.insert(
        tableOrderItem,
        orderItem.toMapForLocal(id),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return id;
  }

  // ini fungsi buat ambil data order
  Future<List<OrderModel>> getAllOrder() async {
    final db = await instance.database;
    // ambil data dari table order, diambil dari yang id nya paling besar
    // Jadi data paling baru, dia paling atas
    final result = await db.query('orders', orderBy: 'id DESC');
    // ubah data dari  map jadi list
    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  // Ambil data order kalau gagal sync ke server
  // dipakai pas aplikasi offline,jadi kalau app nya udah online, maka yang belum
  // di sync datany, bakal dikirim ulang ke server
  Future<List<OrderModel>> getOrdersIsSyncFalse() async {
    final db = await instance.database;
    // Ambil data dari tabel order
    // Yang diambil cuma data order yang belum di sync
    // 0 = belum di sync
    // 1 udah di sync
    final result = await db.query('orders', where: 'is_sync = 0');
    // ubah hasil query dari map jadi list
    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  // Update data order
  // ini untuk ubah status order yang tadinya belum sync, jadi sudah sync
  // atau dari 0 jadi 1
  // nanti diambilnya pake id
  Future<void> updateOrderIsSync(int id) async {
    final db = await instance.database;
    // update data dengan id tertentu, is sync nya diubah jadi 1,
    // artinya data udah di sync di server
    await db.update(
      'orders',
      {'is_sync': 1},
      // where buat meentukan data mana yang di update
      //  id = ? artinya cari order dengan id tertentu
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Get order item berdasarkan id order
  // Kayak misal id order 5 itu punya 2 produk, nah function ini tuh buat ambil
  // data 2 produk itu
  Future<List<OrderItemModel>> getOrderItemsByIdOrder(int idOrder) async {
    final db = await instance.database;
    // Ambil data dari table order item berdasarkan id order nya
    final result = await db.query('order_items', where: 'id_order = $idOrder');
    // ubah data dari map jadi list
    return result.map((e) => OrderItemModel.fromMap(e)).toList();
  }

  // Buat nyimpen semua data kategori
  Future<void> insertAllCategory(List<Category> categories) async {
    final db = await instance.database;
    for (var category in categories) {
      // loop semua data kategori dari API, lalu di insert kedalam tabel kategori,
      // dan diubah dari objek jadi map
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
