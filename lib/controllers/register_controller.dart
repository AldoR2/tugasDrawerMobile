import 'dart:async';

import 'package:drawer/models/user.model.dart';
import 'package:drawer/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

class RegisterController {
  late final UserService _service;

  String? jenisKelamin;
  DateTime? selectedDate;
  String? stringDate;
  Logger logger = Logger();
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  bool status7 = false;
  bool status8 = false;
  bool statuscp = false;

  final TextEditingController namaLengkapController =
      TextEditingController(); // Tambah controller
  final TextEditingController alamatController =
      TextEditingController(); // Tambah controller
  final List<String> jenisKelaminOptions = ['Laki-laki', 'Perempuan'];
  String emailErrorMessage = "";
  String usernameErrorMessage = "";
  String noTelpErrorMessage = "";
  String passwordErrorMessage = "";
  String confirmPasswordErrorMessage = "";
  String namaLengkapErrorMessage = ""; // Tambah state untuk error message
  String alamatErrorMessage = ""; // Tambah state untuk error message
  String jenisKelaminErrorMessage = "";
  String tanggalLahirErrorMessage = "";
  Timer? emailTypingTimer;
  Timer? usernameTypingTimer;
  Timer? noTelpTypingTimer;
  Timer? passwordTypingTimer;
  Timer? confirmPasswordTypingTimer;
  Timer? namaLengkapTypingTimer; // Tambah timer
  Timer? alamatTypingTimer; // Tambah timer
  final int waktu = 2;

  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void validateEmail(String email) {
    if (email.isEmpty) {
      status3 = true;
      emailErrorMessage = "Email harus diisi";
    } else if (!email.endsWith("@gmail.com") &&
        !email.endsWith("@gmail.co") &&
        !email.endsWith("@student.co.id")) {
      status3 = true;
      emailErrorMessage =
          "Format tidak valid. Harus diakhiri dengan @gmail.com";
    } else {
      status3 = false;
    }
  }

  void validateJenisKelamin() {
    if (jenisKelamin == null) {
      status7 = true;
      jenisKelaminErrorMessage = "Jenis kelamin harus diisi";
    } else {
      status7 = false;
    }
  }

  void validateTanggalLahir() {
    if (tanggalController.value.text.isEmpty) {
      status8 = true;
      tanggalLahirErrorMessage = "Tanggal lahir harus diisi";
    } else {
      status8 = false;
    }
  }

  void validateUsername(String username) {
    if (username.isEmpty) {
      status2 = true;
      usernameErrorMessage = "Username harus diisi";
    } else if (username.contains(" ")) {
      status2 = true;
      usernameErrorMessage =
          "Format tidak sesuai, masukkan username tanpa spasi";
    } else {
      status2 = false;
    }
  }

  void validateNoTelp(String noTelp) {
    if (noTelp.isEmpty) {
      status4 = true;
      noTelpErrorMessage = "No. Telp harus diisi";
    } else if (noTelp.length < 11 || noTelp.length > 13) {
      status4 = true;
      noTelpErrorMessage = "Format Nomor Telpon tidak sesuai";
    } else {
      status4 = false;
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      status6 = true;
      passwordErrorMessage = "Password harus diisi";
    } else if (password.length < 8) {
      status6 = true;
      passwordErrorMessage =
          "Password tidak sesuai, masukkan minimal 8 karakter";
    } else {
      status6 = false;
    }
  }

  void validateConfirmPassword(String confirmPassword) {
    if (confirmPassword.isEmpty) {
      statuscp = true;
      confirmPasswordErrorMessage = "Konfirmasi Password harus diisi";
    } else if (confirmPassword.length < 8) {
      statuscp = true;
      confirmPasswordErrorMessage =
          "Konfirmasi Password tidak sesuai, masukkan minimal 8 karakter";
    } else if (confirmPassword != passwordController.text) {
      statuscp = true;
      confirmPasswordErrorMessage =
          "Konfirmasi password tidak sesuai dengan password";
    } else {
      statuscp = false;
    }
  }

  void validateNamaLengkap(String namaLengkap) {
    final regex = RegExp(r"^[a-zA-Z\s]+$");

    // Fungsi validasi
    logger.d("tes");
    if (namaLengkap.isEmpty) {
      status1 = true;
      namaLengkapErrorMessage = "Nama lengkap harus diisi";
    } else if (!regex.hasMatch(namaLengkap)) {
      status1 = true;
      namaLengkapErrorMessage = "Hanya boleh huruf dan Spasi";
    } else {
      status1 = false;
    }
  }

  void validateAlamat(String alamat) {
    // Fungsi validasi
    if (alamat.isEmpty) {
      status5 = true;
      alamatErrorMessage = "Alamat harus diisi";
    } else {
      status5 = false;
    }
  }

  void startEmailTimer(VoidCallback updateView) {
    status3 = false;
    emailTypingTimer?.cancel();
    emailTypingTimer = Timer(Duration(seconds: waktu), () {
      validateEmail(emailController.text);
      updateView();
    });
  }

  void startUsernameTimer(VoidCallback updateView) {
    status2 = false;
    usernameTypingTimer?.cancel();
    usernameTypingTimer = Timer(Duration(seconds: waktu), () {
      validateUsername(usernameController.text);
      updateView();
    });
  }

  void startNoTelpTimer(VoidCallback updateView) {
    status4 = false;
    noTelpTypingTimer?.cancel();
    noTelpTypingTimer = Timer(Duration(seconds: waktu), () {
      validateNoTelp(noTelpController.text);
      updateView();
    });
  }

  void startConfirmPasswordTimer(VoidCallback updateView) {
    statuscp = false;

    confirmPasswordTypingTimer?.cancel();
    confirmPasswordTypingTimer = Timer(Duration(seconds: waktu), () {
      validateConfirmPassword(confirmPasswordController.text);
      updateView();
    });
  }

  void startPasswordTimer(VoidCallback updateView) {
    status6 = false;

    passwordTypingTimer?.cancel();
    passwordTypingTimer = Timer(Duration(seconds: waktu), () {
      validatePassword(passwordController.text);
      updateView();
    });
  }

  void startNamaLengkapTimer(VoidCallback updateView) {
    // Timer handler
    status1 = false;

    namaLengkapTypingTimer?.cancel();
    namaLengkapTypingTimer = Timer(Duration(seconds: waktu), () {
      logger.d(namaLengkapController.text);
      validateNamaLengkap(namaLengkapController.text);
      updateView();
    });
  }

  void startAlamatTimer(VoidCallback updateView) {
    // Timer handler
    status5 = false;
    alamatTypingTimer?.cancel();
    alamatTypingTimer = Timer(Duration(seconds: waktu), () {
      validateAlamat(alamatController.text);
      updateView();
    });
  }

  Future<bool> saveData() async {
    final namaLengkap = namaLengkapController.text;
    final username = usernameController.text;
    final email = emailController.text;
    final noTelp = noTelpController.text;
    final alamat = alamatController.text;
    final password = passwordController.text;

    validateNamaLengkap(namaLengkap);
    validateUsername(username);
    validateEmail(email);
    validateNoTelp(noTelp);
    validateAlamat(alamat);
    validatePassword(passwordController.text);
    validateConfirmPassword(password);
    validateJenisKelamin();
    validateTanggalLahir();

    if (status1 == true ||
        status2 == true ||
        status3 == true ||
        status4 == true ||
        status5 == true ||
        status6 == true ||
        status7 == true ||
        status8 == true ||
        statuscp == true) {
      Fluttertoast.showToast(
        msg: "Penuhi Validasi terlebih dahulu",
        backgroundColor: Colors.red,
        gravity: ToastGravity.CENTER,
        webPosition: "center",
      );
      return false;
    } else {
      Fluttertoast.showToast(
        msg: "Registrasi Berhasil",
        backgroundColor: Colors.red,
        gravity: ToastGravity.CENTER,
        webPosition: "center",
      );
      final user = User(
        namaLengkap: namaLengkap,
        username: username,
        email: email,
        noTelp: noTelp,
        jenisKelamin: jenisKelamin,
        tglLahir: selectedDate.toString(),
        alamat: alamat,
        password: password,
      );

      final userService = UserService();
      bool success = await userService.saveUserData(user);

      return success;
    }
  }

  void dispose() {
    tanggalController.dispose();
    emailController.dispose();
    usernameController.dispose();
    noTelpController.dispose();
    passwordController.dispose();
    namaLengkapController.dispose(); // Dispose controller
    alamatController.dispose(); // Dispose controller
    emailTypingTimer?.cancel();
    usernameTypingTimer?.cancel();
    noTelpTypingTimer?.cancel();
    passwordTypingTimer?.cancel();
    namaLengkapTypingTimer?.cancel(); // Cancel timer
    alamatTypingTimer?.cancel(); // Cancel timer
  }
}
