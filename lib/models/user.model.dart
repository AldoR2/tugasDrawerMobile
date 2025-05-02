class User {
  final String namaLengkap;
  final String username;
  final String email;
  final String noTelp;
  final String? jenisKelamin;
  final String? tglLahir;
  final String alamat;
  final String password;

  User({
    required this.namaLengkap,
    required this.username,
    required this.email,
    required this.noTelp,
    required this.jenisKelamin,
    required this.tglLahir,
    required this.alamat,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      namaLengkap: json['nama_lengkap'],
      username: json['username'],
      email: json['email'],
      noTelp: json['no_telp'],
      jenisKelamin: json['jenis_kelamin'],
      tglLahir: json['tgl_lahir'],
      alamat: json['alamat'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    "nama_lengkap": namaLengkap,
    "username": username,
    "email": email,
    "no_telp": noTelp,
    "jenis_kelamin": jenisKelamin,
    "tgl_lahir": tglLahir,
    "alamat": alamat,
    "password": password,
  };
}