import 'package:burc_rehberi/burc_detail.dart';
import 'package:burc_rehberi/burc_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Burç rehberi",
      onGenerateRoute: Router.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

const String listBurc = "/";
const String burcDetail = "/burc_detay";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case listBurc:
        return MaterialPageRoute(builder: (_) => burcListesi());
      case burcDetail:
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => burcDetay(args),
          );
        }
        return _errorRorte();

      default:
        return _errorRorte();
    }
  }

  static Route<dynamic> _errorRorte() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('error'),
        ),
        body: Center(
          child: Text("Eror"),
        ),
      );
    });
  }
}
