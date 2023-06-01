class Agenda {
  final String idAgenda;
  final String idPetugas;
  final String judul;
  final String jamAwal;
  final String jamAkhir;
  final String tglAwal;
  final String tglAkhir;
  final String keterangan;

  Agenda({
    required this.idAgenda,
    required this.idPetugas,
    required this.judul,
    required this.jamAwal,
    required this.jamAkhir,
    required this.tglAwal,
    required this.tglAkhir,
    required this.keterangan,
  });

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
      idAgenda: json['id_agenda'],
      idPetugas: json['id_petugas'],
      judul: json['judul'],
      jamAwal: json['jam_awal'],
      jamAkhir: json['jam_akhir'],
      tglAwal: json['tgl_awal'],
      tglAkhir: json['tgl_akhir'],
      keterangan: json['keterangan'],
    );
  }
}
