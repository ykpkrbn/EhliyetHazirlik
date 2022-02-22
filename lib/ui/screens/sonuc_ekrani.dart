import 'package:flutter/material.dart';
import '../../core/db/db.dart';
import '../../core/model/soru_modeli.dart';
import '../constant/renkler.dart';

class SonucEkrani extends StatelessWidget {
  final int score;

  const SonucEkrani(
    this.score, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anaRenk,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            score == 0 ? "Geliştirmelisin" : "Tebrikler",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 80, color: beyazRenk, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          Text(
            "Skorunuz",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28, color: beyazRenk, fontWeight: FontWeight.bold),
          ),
          Text(
            score.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: yesilRenk, fontSize: 80, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Scorelar yeniSkorumuz =
                      Scorelar(score: score, tarih: DateTime.now());
                  DBProvider.dataBase.skorEkle(yeniSkorumuz);

                  Navigator.pushNamedAndRemoveUntil(
                      context, "/SkorlarEkrani", (context) => false);
                },
                color: ikinciRenk,
                shape: const StadiumBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Skorları \nGöster",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: beyazRenk,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Scorelar yeniSkorumuz =
                      Scorelar(score: score, tarih: DateTime.now());
                  DBProvider.dataBase.skorEkle(yeniSkorumuz);

                  Navigator.pushNamedAndRemoveUntil(
                      context, "/", (context) => false);
                },
                color: ikinciRenk,
                shape: const StadiumBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ana Sayfaya \nGit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: beyazRenk,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
