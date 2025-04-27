import 'package:drawer/reusable/reusable_drawer.dart';
import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Halaman Beranda"), centerTitle: true),
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
