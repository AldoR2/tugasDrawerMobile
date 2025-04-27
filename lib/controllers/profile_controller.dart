import 'package:drawer/models/user.model.dart';
import 'package:drawer/services/user_service.dart';

class ProfileController {
  String? namaLengkap;
  String? username;
  String? email;
  String? noTelp;
  String? jenisKelamin;
  String? tglLahir;
  String? alamat;

  void initialize(Function onDataLoaded) async {
    await _loadUser();
    onDataLoaded();
  }

  Future<void> _loadUser() async {
    final userService = UserService();
    User? user = await userService.getUserData();

    if (user != null) {
      namaLengkap = user.namaLengkap;
      username = user.username;
      email = user.email;
      noTelp = user.noTelp;
      jenisKelamin = user.jenisKelamin!;
      tglLahir = user.tglLahir.toString();
      alamat = user.alamat;
    }
  }
}
