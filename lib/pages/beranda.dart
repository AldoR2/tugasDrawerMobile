import 'package:drawer/reusable/reusable_drawer.dart';
import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  @override
  _Beranda createState() => _Beranda();
}

class _Beranda extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Drawer"), centerTitle: true),
        drawer: MyDrawer(),
        body: Container(
          child: Center(
            child: Text("Beranda", style: TextStyle(fontSize: 50.0)),
          ),
        ),
      ),
    );
  }
}
