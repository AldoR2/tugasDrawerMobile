class User {
  final String username;
  final String email;
  final int noTelp;
  final String jenisKelamin;
  final DateTime tglLahir;
  final String alamat;
  final String password;

  User({
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
    username: 'username',
    username: 'email',
    username: 'no_telp',
    username: 'jenis_kelamin',
    username: 'tgl_lahir',
    username: 'alamat',
    username: 'password',
  };
}
