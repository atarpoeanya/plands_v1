import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:plands_v1/jadwalModel.dart';
import 'package:path/path.dart';

// Tabel Jadwal
// Id  |  nama  |  timeStart  |  timeEnd  |  hasAlarm / isRepeating
//  1     ...       ...      ....        0
//  2     ...       ...      ....        0
//  3     ...       ...      ....        0

class DBProvider {
  String namaTable = 'jadwal';

  static final DBProvider db = DBProvider._();
  DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      //iff _database null
      _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, "Plands.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE jadwal ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "nama TEXT,"
          "timeStart TEXT,"
          "timeEnd TEXT,"
          "hasAlarm INTEGER,"
          "isRepeating INTEGER");
    });
  }

  Future newJadwal(Jadwal newJadwal) async {
    final db = await database;
    var raw = await db.insert(namaTable, newJadwal.toJson());
    return raw;
  }

  getjadwal(int id) async {
    final db = await database;
    var res = await db.query("Jadwal", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Jadwal.fromJson(res.first) : null;
  }

  getAll() async {
    final db = await database;
    var res = await db.query("Jadwal");
    List<Jadwal> list =
        res.isNotEmpty ? res.map((c) => Jadwal.fromJson(c)).toList() : [];
    return list;
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from client");
  }

  Future<int> tableIsEmpty() async {
    int count = 0;
    var db = await openDatabase('Plands.db');

    count =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Test'));

    return count;
  }
}
