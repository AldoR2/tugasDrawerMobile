import 'package:drawer/controllers/profile_controller.dart';
import 'package:drawer/reusable/reusable_drawer.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  final _controller = ProfileController();

  @override
  void initState() {
    super.initState();
    _controller.initialize(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Halaman Profile"), centerTitle: true),
        drawer: MyDrawer(),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nama Lengkap: ${_controller.namaLengkap}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(),
                Text(
                  "Username: ${_controller.username}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(),
                Text(
                  "Email: ${_controller.email}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(),
                Text(
                  "No Telepon: ${_controller.noTelp}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(),
                Text(
                  "Jenis Kelamin: ${_controller.jenisKelamin}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(),
                Text(
                  "Tanggal Lahir: ${_controller.tglLahir}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(),
                Text(
                  "Alamat: ${_controller.alamat}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
