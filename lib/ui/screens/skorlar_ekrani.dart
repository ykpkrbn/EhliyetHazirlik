import 'package:flutter/material.dart';

import '../../core/db/db.dart';
import '../constant/renkler.dart';

class SkorlarEkrani extends StatefulWidget {
  const SkorlarEkrani({Key? key}) : super(key: key);

  @override
  State<SkorlarEkrani> createState() => _SkorlarEkraniState();
}

class _SkorlarEkraniState extends State<SkorlarEkrani> {

  skorlariGetirGoster() async {
    final skorlar = await DBProvider.dataBase.skorlariGoster();
    debugPrint("Skorlar : $skorlar");
    return skorlar;
  }

  @override
  void initState() {
    super.initState();
    skorlariGetirGoster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaRenk,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Skorlarınız",
          style: TextStyle(color: beyazRenk, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (context) => false);
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      backgroundColor: anaRenk,
      body: FutureBuilder(
        future: skorlariGetirGoster(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if(snapshot.hasData){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }else if(snapshot.connectionState == ConnectionState.done){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  controller: ScrollController(keepScrollOffset: true),
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    int skorum = snapshot.data[index]["score"];
                    String yil =
                    DateTime.parse(snapshot.data[index]["tarih"])
                        .year
                        .toString();
                    String ay =
                    DateTime.parse(snapshot.data[index]["tarih"])
                        .month
                        .toString();
                    String gun =
                    DateTime.parse(snapshot.data[index]["tarih"])
                        .day
                        .toString();
                    String saat =
                    DateTime.parse(snapshot.data[index]["tarih"])
                        .hour
                        .toString();
                    String dakika =
                    DateTime.parse(snapshot.data[index]["tarih"])
                        .minute
                        .toString();
                    String saniye =
                    DateTime.parse(snapshot.data[index]["tarih"])
                        .second
                        .toString();
                    return Card(
                      color: ikinciRenk,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            buildTarih(gun, ay, yil, saat, dakika, saniye),
                            buildSkor(skorum),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }else {
              return Center(
                child: Text(
                  "Veriler gelirken bir hata oluştu.",
                  style: TextStyle(
                      color: beyazRenk,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              );
            }
          }else{
            return Center(
              child: Text(
                "Skorunuz bulunmamaktadır.",
                style: TextStyle(
                    color: beyazRenk,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            );
          }

        },
      ),
    );
  }

  Expanded buildSkor(int skorum) {
    return Expanded(
      child: Text(
        "Skorunuz $skorum",
        style: TextStyle(
          color: beyazRenk,
          fontSize: 20,
        ),
      ),
    );
  }

  Container buildTarih(String gun, String ay, String yil, String saat,
      String dakika, String saniye) {
    return Container(
      margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: kirmiziRenk, borderRadius: BorderRadius.circular(4)),
      child: Text(
        gun + "/" + ay + "/" + yil + "\n" + saat + ":" + dakika + ":" + saniye,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: beyazRenk,
          fontSize: 20,
        ),
      ),
    );
  }
}
