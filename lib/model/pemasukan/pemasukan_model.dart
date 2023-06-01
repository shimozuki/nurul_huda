class PemasukanModel {
  String idPemasukan;
  String idPetugas;
  String nama;
  String tglPemasukan;
  String totalBayar;

  PemasukanModel({
    required this.idPemasukan,
    required this.idPetugas,
    required this.nama,
    required this.tglPemasukan,
    required this.totalBayar,
  });

  factory PemasukanModel.fromJson(Map<String, dynamic> json) {
    return PemasukanModel(
      idPemasukan: json['id_pemasukan'],
      idPetugas: json['id_petugas'],
      nama: json['nama'],
      tglPemasukan: json['tgl_pemasukan'],
      totalBayar: json['totalbayar'],
    );
  }
}
