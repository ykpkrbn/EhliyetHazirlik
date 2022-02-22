import 'package:ehliyet_hazirlik/ui/screens/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

import '../../../core/data/soru_listesi.dart';
import '../../constant/renkler.dart';
import '../../widgets/my_container.dart';

class SoruCevap extends StatefulWidget {
  const SoruCevap({Key? key}) : super(key: key);

  @override
  _SoruCevapState createState() => _SoruCevapState();
}

class _SoruCevapState extends State<SoruCevap>
    with SingleTickerProviderStateMixin {
  final PageController? _controller = PageController(initialPage: 0);
  bool? isPressed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anaRenk,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: sorular.length,
          itemBuilder: (context, index) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Soru ${index + 1} / ${sorular.length}",
                    style: TextStyle(
                      color: beyazRenk,
                      fontWeight: FontWeight.w300,
                      fontSize: 28,
                    ),
                  ),
                ),
                Divider(
                  color: beyazRenk,
                  height: 8,
                  thickness: 1.5,
                ),
                const SizedBox(height: 40),
                Text(
                  sorular[index].soru!,
                  style: TextStyle(
                    color: beyazRenk,
                    fontSize: Theme.of(context).textTheme.headline6?.fontSize,
                  ),
                ),
                const SizedBox(height: 35),
                sorular[index].resim == null ? const Text("") :Image.asset(sorular[index].resim!),
                sorular[index].resim == null ? const Text("") :const SizedBox(height: 35),
                for (int i = 0; i < sorular[index].cevap!.length; i++)
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          child: MaterialButton(
                            onPressed: isPressed!
                                ? () {}
                                : () {
                                    setState(() {
                                      isPressed = true;
                                    });
                                    if (sorular[index]
                                        .cevap!
                                        .entries
                                        .toList()[i]
                                        .value) {
                                      score += 10;
                                      debugPrint("score : $score");
                                      setState(() {});
                                    }
                                  },
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            color: isPressed!
                                ? sorular[index]
                                        .cevap!
                                        .entries
                                        .toList()[i]
                                        .value
                                    ? yesilRenk
                                    : kirmiziRenk
                                : ikinciRenk,
                            shape: const StadiumBorder(),
                            child: Text(sorular[index].cevap!.keys.toList()[i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: beyazRenk,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.fontSize,
                                )),
                          ),
                        ),
                      ),
                      // Positioned(
                      //     right: 5,
                      //     child: MyContainer(
                      //       child: isPressed!
                      //           ? sorular[index]
                      //                   .cevap!
                      //                   .entries
                      //                   .toList()[i]
                      //                   .value
                      //               ? const Icon(Icons.done)
                      //               : const Icon(Icons.architecture_sharp)
                      //           : const Text(""),
                      //
                      //       /// Burayı reklamla yap
                      //       // sorular[index].cevap!.entries.toList()[i].value ?
                      //       // const Icon(Icons.done): const Icon(Icons.architecture_sharp),
                      //
                      //       color: isPressed!
                      //           ? sorular[index]
                      //                   .cevap!
                      //                   .entries
                      //                   .toList()[i]
                      //                   .value
                      //               ? trueCevap
                      //               : falseCevap
                      //           : ikinciRenk,
                      //     )),
                    ],
                  ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed!
                          ? index + 1 == sorular.length
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SonucEkrani(score),
                                      ));
                                }
                              : () {
                                  _controller?.nextPage(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      curve: Curves.linear);
                                }
                          : null,
                      child: Text(index + 1 == sorular.length
                          ? "Sınavı Tamamla"
                          : "Sonraki Soru"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
