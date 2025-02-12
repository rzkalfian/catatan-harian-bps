class Kegiatan {
  int? id;
  bool? terealisasi;
  String? tanggal;
  String? target;
  String? nama;
  String? nip_pencatat;
  String? realisasi;
  String? keterangan;

  Kegiatan({
    this.id,
    this.terealisasi,
    this.tanggal,
    this.target,
    this.nama,
    this.nip_pencatat,
    this.realisasi,
    this.keterangan,
  });

  Kegiatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    terealisasi = json['terealisasi'];
    tanggal = json['tanggal'];
    target = json['target'];
    nama = json['nama'];
    nip_pencatat = json['nip_pencatat'];
    realisasi = json['realisasi'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'terealisasi': terealisasi,
      'tanggal': tanggal,
      'target': target,
      'nama': nama,
      'nip_pencatat': nip_pencatat,
      'realisasi': realisasi,
      'keterangan': keterangan,
    };
  }
}
