import 'package:drawer/controllers/login_controller.dart';
import 'package:drawer/reusable/reusable_widget.dart';
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
        appBar: AppBar(title: Text('Halaman Login'), centerTitle: true),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 100),
                  Text(
                    "Selamat datang, By One Chou?",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Silakan melakukan login untuk mengakes aplikasi",
                    style: TextStyle(fontFamily: 'Poppins', color: Colors.grey),
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
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(
                        Colors.blueAccent,
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
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
                  ),

                  SizedBox(height: 10),
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
                                color:
                                    Colors.blueAccent, // Warna teks registrasi
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
