import 'package:path/path.dart';
import 'package:ppkd_b4_sofyan/day19/model/member_model.dart';
// import 'package:ppkd_b4/day_19/model/Member_model.dart';
import 'package:ppkd_b4_sofyan/day19/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const tableUser = 'users';
  static const tableMember = 'Members';

  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'ppkd.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)",
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (newVersion == 2) {
          await db.execute(
            "CREATE TABLE $tableMember(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, class TEXT, age int, )",
          );
        }
      },

      version: 2,
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      tableUser,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    //query adalah fungsi untuk menampilkan data (READ)
    final List<Map<String, dynamic>> results = await dbs.query(
      tableUser,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }

  //MENAMBAHKAN SISWA
  static Future<void> createMember(MemberModel Member) async {
    final dbs = await db();
    //Insert adalah fungsi untuk menambahkan data (CREATE)
    await dbs.insert(
      tableMember,
      Member.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(Member.toMap());
  }

  //GET SISWA
  static Future<List<MemberModel>> getAllMember() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(tableMember);
    print(results.map((e) => MemberModel.fromMap(e)).toList());
    return results.map((e) => MemberModel.fromMap(e)).toList();
  }
}
