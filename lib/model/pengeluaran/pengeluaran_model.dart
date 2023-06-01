class Pengeluaran {
  final String idPengeluaran;
  final String idKategori;
  final String idPetugas;
  final String tglPengeluaran;
  final String nominal;
  final String keterangan;

  Pengeluaran({
    required this.idPengeluaran,
    required this.idKategori,
    required this.idPetugas,
    required this.tglPengeluaran,
    required this.nominal,
    required this.keterangan,
  });

  factory Pengeluaran.fromJson(Map<String, dynamic> json) {
    return Pengeluaran(
      idPengeluaran: json['id_pengeluaran'],
      idKategori: json['id_kategori'],
      idPetugas: json['id_petugas'],
      tglPengeluaran: json['tgl_pengeluaran'],
      nominal: json['nominal'],
      keterangan: json['keterangan'],
    );
  }
}
