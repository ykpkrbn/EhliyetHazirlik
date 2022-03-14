import 'package:flutter/material.dart';
import '../../core/db/db.dart';
import '../../core/model/soru_modeli.dart';
import '../constant/image.dart';
import '../constant/renkler.dart';

class SonucEkrani extends StatelessWidget {
  final int score;

  const SonucEkrani(
    this.score, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: anaRenk,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            score < 70
                ? "Maalesef sınavda başarısız oldunuz. Tekrar hazırlanmakta fayda var"
                : "Tebrikler sınavı geçtiniz",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline3?.fontSize,
                color: beyazRenk,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Skorunuz",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline3?.fontSize,
                color: beyazRenk,
                fontWeight: FontWeight.bold),
          ),
          Text(
            score.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: yesilRenk, fontSize: 80, fontWeight: FontWeight.bold),
          ),
          size < 390 ?
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 8,
                        child: ResimlerYolu().basarilarim),
                    Text(
                      "Skorları \nGöster",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: beyazRenk,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 8,
                        child: ResimlerYolu().uygulamam),
                    Text(
                      "Ana Sayfaya \nGit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: beyazRenk,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ):
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Scorelar yeniSkorumuz =
                        Scorelar(score: score, tarih: DateTime.now());
                    DBProvider.dataBase.skorEkle(yeniSkorumuz);

                    Navigator.pushNamedAndRemoveUntil(
                        context, "/SkorlarEkrani", (context) => false);
                  },
                  color: ikinciRenk,
                  shape: const StadiumBorder(),
                  child: FittedBox(
                    child: Row(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                            child: ResimlerYolu().basarilarim),
                        Text(
                          "Skorları \nGöster",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: beyazRenk,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Scorelar yeniSkorumuz =
                        Scorelar(score: score, tarih: DateTime.now());
                    DBProvider.dataBase.skorEkle(yeniSkorumuz);

                    Navigator.pushNamedAndRemoveUntil(
                        context, "/", (context) => false);
                  },
                  color: ikinciRenk,
                  shape: const StadiumBorder(),
                  child: FittedBox(
                    child: Row(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                            child: ResimlerYolu().uygulamam),
                        Text(
                          "Ana Sayfaya \nGit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: beyazRenk,
                          ),
                        ),
                      ],
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
