import 'package:drawer/controllers/register_controller.dart';
import 'package:drawer/pages/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterController _controller = RegisterController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 80),
            Image.asset(
                          "assets/card.png",
                          width: 120.0,
                          height: 120.0,
                        ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Registrasi Akun",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 223, 96, 37),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Silakan isi form untuk registrasi",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                    fontSize: 20),
                ),
                const SizedBox(height: 40),
                ReusableTextField(
                  label: "Nama Lengkap",
                  icon: Icons.tag_faces,
                  controller: _controller.namaLengkapController,
                  obscureText: false,
                  onChangedCallback: () {
                    setState(() {
                      _controller.startNamaLengkapTimer(() {
                        setState(() {});
                      }); // Mulai timer
                    });
                  },
                  errorTextProvider: () {
                    return (_controller.status1)
                        ? _controller.namaLengkapErrorMessage
                        : null;
                  },
                ),
                const SizedBox(height: 20),
                ReusableTextField(
                  label: "Username",
                  icon: Icons.person,
                  controller: _controller.usernameController,
                  obscureText: false,
                  onChangedCallback: () {
                    setState(() {
                      _controller.startUsernameTimer(() {
                        setState(() {});
                      });
                    });
                  },
                  errorTextProvider: () {
                    return (_controller.status2)
                        ? _controller.usernameErrorMessage
                        : null;
                  },
                ),
                const SizedBox(height: 20),
                ReusableTextField(
                  label: "Email",
                  icon: Icons.email,
                  controller: _controller.emailController,
                  obscureText: false,
                  onChangedCallback: () {
                    setState(() {
                      _controller.startEmailTimer(() {
                        setState(() {});
                      });
                    });
                  },
                  errorTextProvider: () {
                    return (_controller.status3)
                        ? _controller.emailErrorMessage
                        : null;
                  },
                ),

                const SizedBox(height: 20),
                ReusableTextField(
                  label: "No. Telp",
                  icon: Icons.phone,
                  controller: _controller.noTelpController,
                  obscureText: false,
                  onChangedCallback: () {
                    setState(() {
                      _controller.startNoTelpTimer(() {
                        setState(() {});
                      });
                    });
                  },
                  errorTextProvider: () {
                    return (_controller.status4)
                        ? _controller.noTelpErrorMessage
                        : null;
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: DropdownButtonFormField<String>(
                    value: _controller.jenisKelamin,
                    onChanged: (String? newValue) {
                      setState(() {
                        _controller.jenisKelamin = newValue;
                      });
                    },
                    items:
                        _controller.jenisKelaminOptions
                            .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                            .toList(),
                    decoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                      prefixIcon: const Icon(Icons.transgender),
                      filled: true,
                      fillColor: Colors.amber[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 223, 96, 37))
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 223, 96, 37))
                        ),
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 223, 96, 37))
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Pilih Jenis Kelamin'
                                : null,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    controller: _controller.tanggalController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _controller.selectedDate = pickedDate;
                          _controller.tanggalController.text = DateFormat(
                            'dd/MM/yyyy',
                          ).format(pickedDate);
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Tanggal Lahir",
                      prefixIcon: const Icon(Icons.date_range),
                      suffixIcon: const Icon(Icons.calendar_today),
                      filled: true,
                      fillColor: Colors.amber[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 223, 96, 37))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 223, 96, 37))
                        ),
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 223, 96, 37))
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tanggal Lahir harus diisi';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 25),
                ReusableTextField(
                  label: "Alamat",
                  icon: Icons.location_city,
                  controller: _controller.alamatController,
                  obscureText: false,
                  onChangedCallback: () {
                    setState(() {
                      _controller.startAlamatTimer(() {
                        setState(() {});
                      }); // Mulai timer
                    });
                  },
                  errorTextProvider: () {
                    return (_controller.status5)
                        ? _controller.alamatErrorMessage
                        : null;
                  },
                ),
                const SizedBox(height: 20),
                ReusableTextField(
                  label: "Password",
                  icon: Icons.lock,
                  controller: _controller.passwordController,
                  obscureText: true,
                  onChangedCallback: () {
                    setState(() {
                      _controller.startPasswordTimer(() {
                        setState(() {});
                      });
                    });
                  },
                  errorTextProvider: () {
                    return (_controller.status6)
                        ? _controller.passwordErrorMessage
                        : null;
                  },
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle( // Hilangkan 'const' di sini
                        backgroundColor: const WidgetStatePropertyAll<Color>(
                          Color.fromARGB(255, 223, 96, 37),
                        ),
                        elevation: WidgetStatePropertyAll(3),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>( // Ganti 'WidgetStateProperty' menjadi 'MaterialStateProperty'
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _controller.saveData(context);
                      },
                      child: const Text(
                        'Simpan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Sudah memiliki akun? "),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Color.fromARGB(255, 223, 96, 37),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
