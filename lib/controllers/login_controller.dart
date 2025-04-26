import 'dart:async';

import 'package:drawer/pages/beranda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginController {
  bool status1 = false;
  bool status2 = false;

  String usernameErrorMessage = "";
  String passwordErrorMessage = "";

  Timer? usernameTypingTimer;
  Timer? passwordTypingTimer;

  final int waktu = 2;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void validateUsername(String username) {
    if (username.isEmpty) {
      status1 = true;
      usernameErrorMessage = "Username harus diisi";
    } else if (username.contains(" ")) {
      status1 = true;
      usernameErrorMessage =
          "Format tidak sesuai, masukkan username tanpa spasi";
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      status2 = true;
      passwordErrorMessage = "Password harus diisi";
    } else if (password.length < 8) {
      status2 = true;
      passwordErrorMessage =
          "Password tidak sesuai, masukkan minimal 8 karakter";
    }
  }

  void startUsernameTimer(VoidCallback updateView) {
    status1 = false;
    usernameTypingTimer?.cancel();
    usernameTypingTimer = Timer(Duration(seconds: waktu), () {
      validateUsername(usernameController.text);
      updateView();
    });
  }

  void startPasswordTimer(VoidCallback updateView) {
    status2 = false;

    passwordTypingTimer?.cancel();
    passwordTypingTimer = Timer(Duration(seconds: waktu), () {
      validatePassword(passwordController.text);
      updateView();
    });
  }

  void checkLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Beranda()),
    );
  }

  void dispose() {}
}
