import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/soru_modeli.dart';

class DBProvider {
  DBProvider._();

  //Dışardan erişim sağlamak için bu komut kullanılır.
  static final DBProvider dataBase = DBProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDataBase();
      return _database;
    }
  }

  initDataBase() async {
    return await openDatabase(
        join(
          await getDatabasesPath(),
          "ehliyet_skorlari.db",
        ), onCreate: (db, versiyon) async {
      await db.execute('''
        CREATE TABLE skorlar (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        score INTEGER, tarih TEXT)
        ''');
    }, version: 1);
  }

  skorEkle(Scorelar scorelar) async {
    final db = await database;
    db?.insert("skorlar", scorelar.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<dynamic> skorlariGoster() async {
    final db = await database;
    var res = await db!.query("skorlar", orderBy: "tarih DESC");
    if (res.isEmpty) {
      return null;
    } else {
      var resultMap = res.toList();
      return resultMap.isNotEmpty ? resultMap : null;
    }
  }
}
