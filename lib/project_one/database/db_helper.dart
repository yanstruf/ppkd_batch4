import 'package:path/path.dart';
import 'package:ppkd_b4_sofyan/project_one/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _database;

  // Nama database dan versi
  static const _dbName = 'user_database.db';
  static const _dbVersion = 3;

  static const tableUser = 'users';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inisialisasi database
  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // Membuat tabel saat database pertama kali dibuat
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUser(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        email TEXT,
        noHp TEXT,
        password TEXT,
        kota TEXT
      )
    ''');
    print('Database & tabel "$tableUser" berhasil dibuat (v$version)');
  }

  // Jalankan kalau versi database naik
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('Upgrade database dari versi $oldVersion ke $newVersion');

    if (oldVersion < 2) {
      // Contoh upgrade: tambahkan kolom baru
      await db.execute('ALTER TABLE $tableUser ADD COLUMN gender TEXT');
      print('Kolom gender berhasil ditambahkan ke tabel users');
    }

    // Kalau nanti naik ke versi 3, tinggal tambahkan:
    // if (oldVersion < 3) { ... }
  }

  // CREATE
  Future<int> insertUser(UserModel user) async {
    final db = await database;
    return await db.insert(tableUser, user.toMap());
  }

  // READ
  Future<List<UserModel>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableUser);
    return List.generate(maps.length, (i) {
      return UserModel.fromMap(maps[i]);
    });
  }

  // UPDATE
  Future<int> updateUser(UserModel user) async {
    final db = await database;
    final id = user.toMap()['id'];
    return await db.update(
      tableUser,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE
  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(tableUser, where: 'id = ?', whereArgs: [id]);
  }

  // Login verif
  Future<UserModel?> loginUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      tableUser,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first); //User ditemukan
    } else {
      return null; //Tidak ditemukan
    }
  }
}
