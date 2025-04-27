import 'package:drawer/reusable/reusable_drawer.dart';
import 'package:flutter/material.dart';

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
        drawer: MyDrawer(),
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
