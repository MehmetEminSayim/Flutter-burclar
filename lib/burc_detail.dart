import 'package:burc_rehberi/burc_list.dart';
import 'package:flutter/material.dart';

import 'models/burc.dart';

class burcDetay extends StatelessWidget {
  final int data;
  burcDetay(this.data);

  @override
  Widget build(BuildContext context) {
    Burc secilenBurc = burcListesi.tumBurclar[data];
    return Scaffold(
        primary: false,
        body: CustomScrollView(
          primary: true,
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              primary: true,
              backgroundColor: Colors.pink,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "images/" + secilenBurc.burcBuyukResim,
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.pink.shade100,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    secilenBurc.burcDetay,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
