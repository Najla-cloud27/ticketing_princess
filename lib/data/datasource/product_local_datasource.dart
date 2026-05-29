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

// // ini untuk akses data di local dan do database, dan ambil database di database lokal
// buat akses dara di lokal bikin database, amnbil data dari database
class ProductLocalDatasource {
  // sama kayak kita kita bikin kantor pusat
  // ini dilakukan , biar kalau orang mau akses product local datasource itu engga bikin object berkali kali

  // atau gampangnya kita bikin 1 kantor pusat
  // kalo orang mau akses kantor pusat, dia langsung akses kantor pusat itu
  // jadi kalau butuh data , ya dateng aja ke kantor pusat engga usah bikin kantor pusat sendiri sendiri

  // ini namanya singleton Pattern => objek utama yang bakal dipakai di seluruh aplikasi, jad setiap kita mau akses datanya ga perlu bikin objek baru
  ProductLocalDatasource._init();

  // varibrl instance itu buat nampung objek utama yang udah kita buat, jadi setiap kita mau akses datanya tinggal akses instance itu
  static final ProductLocalDatasource instance = ProductLocalDatasource._init();

  final String tableProduct = 'products';
  final String tableOrder = 'orders';
  final String tableOrderItem = 'order_items';
  final String tableCategories = 'category';

  // kalau database nya ga ada maka buat database baru
  static Database? _database;
  // _database itu buat nyimpan objek database, karena ps awal buka aplikasi database nya engga ada jadi kita buat database baru, terus kita simpan objek database itu di _database, jadi kalau kita mau akses database lagi kita tinggal akses _database itu, ga perlu bikin database baru lagi

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

  /// Inisialisasi database
  /// buat cari lokasi penyimpanan database lalu membuka atau membuat database
  Future<Database> _initDb() async {
    // getdatabasepath itu dipakai buat ambil lokasi folder database di Hp
    final path = await getDatabasesPath();
    // ini variable buat lokasi penyimpanan database
    // jadi nanti database kita disimpan dengan nama ticketing.db di folder database yang udah kita ambil tadi
    final databasepath = '$path/ticketing.db';

    // open database dipakai buat membuka database
    // kalau database belum ada sqflite bakal bikin baru
    // version 1 artinya versi database
    // on create dipakai kalau database baru dibuat, maka jalankan function_createDB
    // untuk membuat tabel tabelnya
    return openDatabase(databasepath, version: 1, onCreate: _createDB);
  }

  // Ambil database
  // ini getter untuk ambil database, jadi nanti kalau butuh database, tinggal panggil instance.database
  Future<Database> get database async {
    // kalau database sudah ada , langsung pakai database yang ada
    // ada ! karena kita udah yakin kalau databasenya ada, soalnya kan udah di cek
    if (_database != null) return _database!;
    // kalau ternyata database nya masih null, maka buat atau buka dulu database nya  lewat _initDb
    _database = await _initDb();
    // setelah dibuat atau dibuka tinggal dikembalikkn aja pakai return
    return _database!;
  }

  // Input semua data produk
  // ini buat simpen data produk ke database dalam bentuk list produk dari API
  Future<void> insertAllProducts(List<Product> products) async {
    // mengambil database dulu , karena kita mau masukin data ke database, jadi kita harus pastiin dulu databasenya udah siap buat dipake

    // terus ini dibagian ini datanya di loop satu per satu
    final db = await instance.database;

    // data di loop satu per satu
    for (var product in products) {
      // masukkin data pake keyword insert
      // karena buat produk, berarti masukkiinnya ke table produk
      // tolocalmap itu artinya ubah produk dari api kan bentuknya objek
      // jadi diubah jadi map>string>dynamic
      // kenapa karena sqflite kan nyimpen data bentuknya map
      await db.insert(
        // kalau data yang diinput nanti ternyata ada konflik
        tableProduct,
        product.toLocalMap(),
        // maka data lama bakal diganti dengan data baru
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Hapus semua data produk dari database
  Future<void> removeAllProduct() async {
    // akses atau ambil database
    final db = await instance.database;
    // langsung hapus semua data di tabel produk soalnya gapake where
    await db.delete(tableProduct);
  }

  // Get data produk
  Future<List<Product>> getAllProducts() async {
    // ambil database
    final db = await instance.database;

    // rawquesry itu cuma buat nulis sql query manual
    // querynya buat ambil data dari tabel produk dan kategory sekaligus
    // p buat produk
    // c buat category
    // p* buat ambil semua data produk
    // ini namnya left join untuk gabungin data produk dan kategori  berdasarkan caetgory_id
    // karena kalau left join semua data prdouk tetap diambil
    // data kategori yang gada di produk bakal null

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

    // ini dipakai buat list<product> dari data map hasil query
    return List.generate(maps.length, (index) {
      // ambil data produk hasil query bentuknya map.string, dan dynamic
      final productMap = maps[index];
      // buat bikin map khusus kategori
      // jadi kan hasil query itu gabungan data produkdan kategori
      // jadi nanti data kategorinya dipisahkan oleh category map baru nanti diubah jadi objek kategori
      final categoryMap = {
        'id': productMap['category_id'],
        'name': productMap['category_name'],
        'description': productMap['category_description'],
        'image': productMap['category_image'],
        'created_at': productMap['category_created_at'],
        'updated_at': productMap['category_updated_at'],
      };

      // ubah data map menjadi objek produk
      return Product.fromLocalMap(
        productMap,
        // membuat salinan produk tapi categorynya diisi dengan objek
      ).copyWith(
        category:
            // mengubah map kategori jadi objek kategori hasil akhirnya produk udah punya kategori
            Category.fromMap(categoryMap),
      );
    });
  }

  // buat nyimpan data order ke database lokal, hasilnya nanti bakal mengembalikkan
  // id order yang baru dibuat
  Future<int> insertOrder(OrderModel order) async {
    final db = await instance.database;

    // mengubah data objek order jadi map
    int id = await db.insert(
      tableOrder,
      order.toMapForLocal(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // loop semua item yang ada di order
    // misal di 2 transaksi ada beberpa produk, maka setiap produk bakal disimpan ke table order item
    for (var orderItem in order.orders) {
      // simpan ke table order item
      // diubah dulu jadi map
      // id order dikirim supaya order item tau dia punya id order yang mana
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
    // jadi data paling baru, dia paling atas
    final result = await db.query(tableOrder, orderBy: 'id DESC');

    // ubah data dari map jadi list
    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  // Ambil data order kalau gagal sync ke server
  // dipakai pas aplikasinya offline, jadi kalau appnya udah online maka yang belum di sync datanya, bakal dikirim ulang ke server
  Future<List<OrderModel>> getOrdersIsSyncFalse() async {
    final db = await instance.database;
    // ambil data dari tabel order
    // yang diambil cuma data order yang belum di sync
    // 0 - belum di sync
    // 1 - uda di sync
    final result = await db.query(tableOrder, where: 'is_sync = 0');

    // ubah hasil query dari map jadi list
    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  // Update data order
  // ini untuk uubah status order yang tadinya belum di sync jadi udah di sync
  // atau dari 0 jadi 1
  // nanti diambilnya pake id
  Future<void> updateOrderIsSync(int id) async {
    final db = await instance.database;
    // update data dengan id tertentu , is sync ny DIUBAH JADI 1
    // artinya data udah di sync di servr
    await db.update(
      tableOrder,
      {'is_sync': 1},
      // where buat menentukan data nama yang di update
      // id ?  artinya cari order dengan id tertentu
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Get order item berdasarkan id order
  // kayak misal id order 5 itu punya 2 produk nah function itu buat ambil data 2 produk itu
  Future<List<OrderItemModel>> getOrderItemsByIdOrder(int idOrder) async {
    final db = await instance.database;

    // ambil data dari table order items berdasarkan
    final result = await db.query(
      tableOrderItem,
      where: 'id_order = ?',
      whereArgs: [idOrder],
    );

    // ubah data dri map ke list
    return result.map((e) => OrderItemModel.fromMap(e)).toList();
  }

  // buat nyimpen semua data kategori
  Future<void> insertAllCategory(List<Category> categories) async {
    // ambil database
    final db = await instance.database;

    for (var category in categories) {
      // loop semua data kategori dari api lalu di inserta kedalam tabel kategori
      // dan diubah dari objek jadi map
      await db.insert(
        tableCategories,
        category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // hapus remove kategori
  Future<void> removeAllCategory() async {
    final db = await instance.database;

    await db.delete(tableCategories);
  }
}
