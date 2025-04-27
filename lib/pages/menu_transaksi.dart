import 'package:drawer/reusable/reusable_drawer.dart';
import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  @override
  _Transaksi createState() => _Transaksi();
}

class _Transaksi extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Drawer"),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: Container(
          child: Center(
            child: Text(
              "Transaksi",
              style: TextStyle(fontSize: 50.0),
            ),
          ),
        ),
      ),
    );
  }
}
