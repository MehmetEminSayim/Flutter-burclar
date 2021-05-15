import 'package:burc_rehberi/models/burc.dart';
import 'package:burc_rehberi/utils/strings.dart';
import 'package:flutter/material.dart';

class burcListesi extends StatelessWidget {
  static List<Burc> tumBurclar = veriKaynaginiHazirla();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeHazirla(),
    );
  }

  static List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];
    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";
      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return BurcListeEleman(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget BurcListeEleman(BuildContext context, int index) {
    Burc burcElement = tumBurclar[index];

    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed("/burc_detay", arguments: index);
        },
        leading: Image.asset(
          "images/" + burcElement.burcKucukResim,
          width: 64,
          height: 64,
        ),
        title: Text(
          burcElement.burcAdi,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade300),
        ),
        subtitle: Text(
          burcElement.burcTarihi,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
