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
          "id INTEGER PRIMARY KEY,"
          "nama TEXT,"
          "timeStart TEXT,"
          "timeEnd TEXT,"
          "hasAlarm INTEGER,"
          "isRepeating INTEGER");
    });
  }

  Future<List<Map<String, dynamic>>> getMapList() async {
    Database db = await database;
    final List<Map<String, dynamic>> result = await db.query(namaTable);
    return result;
  }

  Future<List<Jadwal>> getList() async {
    final List<Map<String, dynamic>> expensesMapList = await getMapList();
    final List<Jadwal> expensesList = [];
    expensesMapList.forEach((expensesMap) {
      expensesList.add(Jadwal.fromJson(expensesMap));
    });
    return expensesList;
  }

  newJadwal(Jadwal newJadwal) async {
    final db = await database;
    var raw = await db.insert(namaTable, newJadwal.toJson());
    return raw;
  }

  getjadwal(int id) async {
    final db = await database;
    var res = await db.query("Jadwal", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Jadwal.fromJson(res.first) : null;
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
