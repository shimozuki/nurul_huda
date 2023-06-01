import 'dart:convert';

ModelShalatMonthly modelShalatMonthlyFromMap(String str) =>
    ModelShalatMonthly.fromMap(json.decode(str));

String modelShalatMonthlyToMap(ModelShalatMonthly data) =>
    json.encode(data.toMap());

class ModelShalatMonthly {
  ModelShalatMonthly({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory ModelShalatMonthly.fromMap(Map<String, dynamic> json) =>
      ModelShalatMonthly(
        status: json["status"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    required this.id,
    required this.lokasi,
    required this.daerah,
    required this.koordinat,
    required this.jadwal,
  });

  String id;
  String lokasi;
  String daerah;
  Koordinat koordinat;
  List<Jadwal> jadwal;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        lokasi: json["lokasi"],
        daerah: json["daerah"],
        koordinat: Koordinat.fromMap(json["koordinat"]),
        jadwal: List<Jadwal>.from(json["jadwal"].map((x) => Jadwal.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "lokasi": lokasi,
        "daerah": daerah,
        "koordinat": koordinat.toMap(),
        "jadwal": List<dynamic>.from(jadwal.map((x) => x.toMap())),
      };
}

class Jadwal {
  Jadwal({
    required this.tanggal,
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    required this.date,
  });

  String tanggal;
  String imsak;
  String subuh;
  String terbit;
  String dhuha;
  String dzuhur;
  String ashar;
  String maghrib;
  String isya;
  String date;

  factory Jadwal.fromMap(Map<String, dynamic> json) => Jadwal(
        tanggal: json["tanggal"],
        imsak: json["imsak"],
        subuh: json["subuh"],
        terbit: json["terbit"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        ashar: json["ashar"],
        maghrib: json["maghrib"],
        isya: json["isya"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "tanggal": tanggal,
        "imsak": imsak,
        "subuh": subuh,
        "terbit": terbit,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "ashar": ashar,
        "maghrib": maghrib,
        "isya": isya,
        "date": date,
      };
}

class Koordinat {
  Koordinat({
    required this.lat,
    required this.lon,
    required this.lintang,
    required this.bujur,
  });

  double lat;
  double lon;
  String lintang;
  String bujur;

  factory Koordinat.fromMap(Map<String, dynamic> json) => Koordinat(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        lintang: json["lintang"],
        bujur: json["bujur"],
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "lintang": lintang,
        "bujur": bujur,
      };
}
