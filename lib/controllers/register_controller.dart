import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegisterController {
  String? jenisKelamin;
  DateTime? selectedDate;
  Logger logger = Logger();
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;

  final TextEditingController namaLengkapController =
      TextEditingController(); // Tambah controller
  final TextEditingController alamatController =
      TextEditingController(); // Tambah controller
  final List<String> jenisKelaminOptions = ['Laki-laki', 'Perempuan'];
  String emailErrorMessage = "";
  String usernameErrorMessage = "";
  String noTelpErrorMessage = "";
  String passwordErrorMessage = "";
  String namaLengkapErrorMessage = ""; // Tambah state untuk error message
  String alamatErrorMessage = ""; // Tambah state untuk error message
  Timer? emailTypingTimer;
  Timer? usernameTypingTimer;
  Timer? noTelpTypingTimer;
  Timer? passwordTypingTimer;
  Timer? namaLengkapTypingTimer; // Tambah timer
  Timer? alamatTypingTimer; // Tambah timer
  final int waktu = 2;

  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
    }
  }

  void validateNoTelp(String noTelp) {
    if (noTelp.isEmpty) {
      status4 = true;
      noTelpErrorMessage = "No. Telp harus diisi";
    } else if (noTelp.length < 11 || noTelp.length > 13) {
      status4 = true;
      noTelpErrorMessage = "Format Nomor Telpon tidak sesuai";
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
    }
  }

  void validateAlamat(String alamat) {
    // Fungsi validasi
    if (alamat.isEmpty) {
      status5 = true;
      alamatErrorMessage = "Alamat harus diisi";
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

  void saveData(BuildContext context) {
    Navigator.pop(context);
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
