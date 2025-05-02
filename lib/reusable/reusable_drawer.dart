import 'package:drawer/controllers/profile_controller.dart';
import 'package:drawer/pages/beranda.dart';
import 'package:drawer/pages/login.dart';
import 'package:drawer/pages/menu_pengaturan.dart';
import 'package:drawer/pages/menu_profile.dart';
import 'package:drawer/pages/menu_proyek.dart';
import 'package:drawer/pages/menu_transaksi.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("${_controller.namaLengkap}"),
            accountEmail: Text(" ${_controller.email}"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/icons8-male-user-76.png'),
            ),
          ),
          ListTile(
            title: Text("Beranda"),
            trailing: Icon(Icons.dashboard_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Proyek"),
            trailing: Icon(Icons.library_books),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Proyek()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Transaksi"),
            trailing: Icon(Icons.handshake_rounded),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Transaksi()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Pengaturan"),
            trailing: Icon(Icons.settings_applications),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pengaturan()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Profile"),
            trailing: Icon(Icons.person_pin_rounded),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          Divider(),
          ListTile(
            iconColor: Colors.red,
            title: Text("Logout"),
            trailing: Icon(Icons.login_outlined),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
