import 'dart:html';
import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'jadwalModel.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    //iff _database null
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, "Plands.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Jadwal ("
          "id INTEGER PRIMARY KEY,"
          "nama TEXT,"
          "timeStart TEXT,"
          "timeEnd TEXT,"
          "hasAlarm INTEGER,"
          "isRepeating INTEGER");
    });
  }

  newJadwal(Jadwal newJadwal) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Jadwal (id,nama,timeStart,timeEnd,hasAlarm,isRepeating)"
        " VALUES (?,?,?,?,?,?)",
        [
          id,
          newJadwal.nama,
          newJadwal.timeStart,
          newJadwal.timeEnd,
          newJadwal.hasAlarm,
          newJadwal.isRepeating
        ]);
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
}
