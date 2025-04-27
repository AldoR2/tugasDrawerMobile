import 'package:drawer/controllers/login_controller.dart';
import 'package:drawer/reusable/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:drawer/pages/register.dart';
import 'package:drawer/pages/beranda.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _controller = LoginController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 80),
            Image.asset("assets/padlock.png", width: 120.0, height: 120.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Login disini",
                    style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 223, 96, 37),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    "Selamat datang kembali",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 40),
                  ReusableTextField(
                    label: "Username",
                    inputType: TextInputType.name,
                    icon: Icons.email,
                    controller: _controller.usernameController,
                    obscureText: false,
                    onChangedCallback: () {
                      setState(() {
                        _controller.startUsernameTimer(() {
                          if (mounted) {
                            setState(() {});
                          }
                        });
                      });
                    },
                    errorTextProvider: () {
                      return (_controller.status1)
                          ? _controller.usernameErrorMessage
                          : null;
                    },
                  ),
                  SizedBox(height: 20),
                  ReusableTextField(
                    label: "Password",
                    inputType: TextInputType.visiblePassword,
                    icon: Icons.lock,
                    controller: _controller.passwordController,
                    obscureText: true,
                    onChangedCallback: () {
                      setState(() {
                        _controller.startPasswordTimer(() {
                          if (mounted) {
                            setState(() {});
                          }
                        });
                      });
                    },
                    errorTextProvider: () {
                      return (_controller.status2)
                          ? _controller.passwordErrorMessage
                          : null;
                    },
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          // Hilangkan 'const' di sini
                          backgroundColor: const WidgetStatePropertyAll<Color>(
                            Color.fromARGB(255, 223, 96, 37),
                          ),
                          elevation: WidgetStatePropertyAll(3),
                          shape: WidgetStateProperty.all<
                            RoundedRectangleBorder
                          >(
                            // Ganti 'WidgetStateProperty' menjadi 'MaterialStateProperty'
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          bool success = await _controller.checkLogin();

                          if (!mounted) return;

                          if (mounted) {
                            setState(() {
                              if (success) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Beranda(),
                                  ),
                                );
                              }
                            });
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center the text
                      children: [
                        const Text(
                          "Belum memiliki akun? ",
                        ), // Bagian teks "Belum memiliki akun? "
                        MouseRegion(
                          // Widget yang mendeteksi pergerakan mouse
                          cursor:
                              SystemMouseCursors
                                  .click, // Mengubah kursor menjadi tangan
                          child: GestureDetector(
                            // Widget yang mendeteksi tap
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ), // Navigasi ke Register
                              );
                            },
                            child: const Text(
                              "Registrasi", // Teks "Registrasi" yang bisa diklik
                              style: TextStyle(
                                color: Color.fromARGB(
                                  255,
                                  223,
                                  96,
                                  37,
                                ), // Warna teks registrasi
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
