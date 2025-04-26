import 'package:drawer/pages/beranda.dart';
import 'package:flutter/material.dart';
import 'package:drawer/pages/login.dart';
import 'package:drawer/pages/menu_pesan.dart';
import 'package:drawer/pages/menu_transaksi.dart';
import 'package:drawer/pages/menu_pengaturan.dart';

class Proyek extends StatefulWidget {
  @override
  _Proyek createState() => _Proyek();
}

class _Proyek extends State<Proyek> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Drawer"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Diega Syaputri"),
                accountEmail: Text("d****@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  // Path sudah disesuaikan dengan informasi dari pubspec.yaml
                  backgroundImage: AssetImage('assets/dega.jpg'),
                ),
              ),
              ListTile(
                title: Text("Beranda"),
                trailing: Icon(Icons.arrow_upward),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Beranda()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Proyek"),
                trailing: Icon(Icons.ondemand_video),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Proyek()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Transasi"),
                trailing: Icon(Icons.cloud),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Transaksi()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Pesan"),
                trailing: Icon(Icons.collections),
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> Pesan()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Pengaturan"),
                trailing: Icon(Icons.comment),
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => Pengaturan()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout),
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> const Login()));
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: Center(
            child: Text(
              "Proyek",
              style: TextStyle(fontSize: 50.0),
            ),
          ),
        ),
      ),
    );
  }
}
