class UserModel {
  final int? id;
  final String nama;
  final String email;
  final String noHp;
  final String kota;

  UserModel({
    this.id,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.kota,
  });

  // Konversi dari Map ke Object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nama: map['nama'],
      email: map['email'],
      noHp: map['noHp'],
      kota: map['kota'],
    );
  }

  // Konversi dari Object ke Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'nama': nama, 'email': email, 'noHp': noHp, 'kota': kota};
  }
}
