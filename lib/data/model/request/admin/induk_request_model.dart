import 'dart:convert';

class IndukRequestModel {
  final String? noRing;
  final DateTime? tanggalLahir;
  final String? jenisKelamin;
  final String? jenisKenari;
  final dynamic keterangan;
  final String? gambarBurung;

  IndukRequestModel({
    this.noRing,
    this.tanggalLahir,
    this.jenisKelamin,
    this.jenisKenari,
    this.keterangan,
    this.gambarBurung,
  });

  // Factory constructor untuk membuat instance dari string JSON
  factory IndukRequestModel.fromJson(String str) =>
      IndukRequestModel.fromMap(json.decode(str));

  // Mengubah instance menjadi string JSON
  String toJson() => json.encode(toMap());

  // Factory constructor untuk membuat instance dari Map<String, dynamic>
  factory IndukRequestModel.fromMap(Map<String, dynamic> json) => IndukRequestModel(
        noRing: json["no_ring"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        jenisKenari: json["jenis_kenari"],
        keterangan: json["keterangan"],
        gambarBurung: json["gambar_burung"],
      );

  // Mengubah instance menjadi Map<String, dynamic>
  Map<String, dynamic> toMap() => {
        "no_ring": noRing,
        // Format tanggal ke 'YYYY-MM-DD' untuk JSON
        "tanggal_lahir": tanggalLahir == null
            ? null
            : "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "jenis_kenari": jenisKenari,
        "keterangan": keterangan,
        "gambar_burung": gambarBurung,
      };
}
