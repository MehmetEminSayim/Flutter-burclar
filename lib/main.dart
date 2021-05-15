import 'package:burc_rehberi/burc_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Burç rehberi",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: burcListesi(),
    );
  }
}
