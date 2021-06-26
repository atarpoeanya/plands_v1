import 'dart:convert';
// To parse this JSON data, do
//
//     final jadwal = jadwalFromJson(jsonString);

Jadwal jadwalFromJson(String str) => Jadwal.fromJson(json.decode(str));

String jadwalToJson(Jadwal data) => json.encode(data.toJson());

class Jadwal {
  Jadwal({
    this.id,
    this.nama,
    this.timeStart,
    this.timeEnd,
    this.hasAlarm,
    this.isRepeating,
  });

  int id;
  String nama;
  String timeStart;
  String timeEnd;
  int hasAlarm;
  int isRepeating;

  factory Jadwal.fromJson(Map<String, dynamic> json) => new Jadwal(
        id: json["id"],
        nama: json["nama"],
        timeStart: json["timeStart"],
        timeEnd: json["timeEnd"],
        hasAlarm: json["hasAlarm"],
        isRepeating: json["isRepeating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "timeStart": timeStart,
        "timeEnd": timeEnd,
        "hasAlarm": hasAlarm,
        "isRepeating": isRepeating,
      };
}
