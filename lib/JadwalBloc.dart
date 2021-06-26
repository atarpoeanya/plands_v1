import 'dart:async';

import 'package:plands_v1/Database.dart';
import 'package:plands_v1/jadwalModel.dart';

class JadwalBloc {
  JadwalBloc() {
    getJadwals();
  }
  final _jadwalController = StreamController<List<Jadwal>>.broadcast();
  get jadwals => _jadwalController.stream;

  dispose() {
    _jadwalController.close();
  }

  getJadwals() async {
    _jadwalController.sink.add(await DBProvider.db.getAll());
  }

  Future<void> delete(int id) async {
    await DBProvider.db.deleteClient(id);
    await getJadwals();
  }

  Future<void> add(Jadwal jadwal) async {
    await DBProvider.db.newJadwal(jadwal);
    await getJadwals();
  }
}
