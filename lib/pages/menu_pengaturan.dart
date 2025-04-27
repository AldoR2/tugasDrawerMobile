
import 'package:drawer/reusable/reusable_drawer.dart';
import 'package:flutter/material.dart';

class Pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Pengaturan"),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: Container(
          child: Center(
            child: Text(
              "Pengaturan",
              style: TextStyle(fontSize: 50.0),
            ),
          ),
        ),
      ),
    );
  }
}
