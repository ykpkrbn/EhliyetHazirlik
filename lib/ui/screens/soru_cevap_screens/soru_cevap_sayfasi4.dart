import 'package:ehliyet_hazirlik/ui/screens/sonuc_ekrani.dart';
import 'package:flutter/material.dart';
import '../../../core/data/soru_listesi4.dart';
import '../../constant/renkler.dart';

class SoruCevap4 extends StatefulWidget {
  const SoruCevap4({Key? key}) : super(key: key);

  @override
  _SoruCevap4State createState() => _SoruCevap4State();
}

class _SoruCevap4State extends State<SoruCevap4>
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
          itemCount: sorular4.length,
          itemBuilder: (context, index) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Soru ${index + 1} / ${sorular4.length}",
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
                  sorular4[index].soru!,
                  style: TextStyle(
                    color: beyazRenk,
                    fontSize: Theme.of(context).textTheme.headline6?.fontSize,
                  ),
                ),
                const SizedBox(height: 35),
                sorular4[index].resim == null
                    ? const Text("")
                    : Image.asset(sorular4[index].resim!),
                sorular4[index].resim == null
                    ? const Text("")
                    : const SizedBox(height: 35),
                for (int i = 0; i < sorular4[index].cevap!.length; i++)
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
                              if (sorular4[index]
                                  .cevap!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 2;
                                debugPrint("score : $score");
                                setState(() {});
                              }
                            },
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            color: isPressed!
                                ? sorular4[index]
                                .cevap!
                                .entries
                                .toList()[i]
                                .value
                                ? yesilRenk
                                : kirmiziRenk
                                : ikinciRenk,
                            shape: const StadiumBorder(),
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                child: Text(sorular4[index].cevap!.keys.toList()[i],
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
                        ),
                      ),
                      // Positioned(
                      //     right: 5,
                      //     child: MyContainer(
                      //       child: isPressed!
                      //           ? sorular3[index]
                      //                   .cevap!
                      //                   .entries
                      //                   .toList()[i]
                      //                   .value
                      //               ? const Icon(Icons.done)
                      //               : const Icon(Icons.architecture_sharp)
                      //           : const Text(""),
                      //
                      //       /// Burayı reklamla yap
                      //       // sorular3[index].cevap!.entries.toList()[i].value ?
                      //       // const Icon(Icons.done): const Icon(Icons.architecture_sharp),
                      //
                      //       color: isPressed!
                      //           ? sorular3[index]
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SonucEkrani(score),
                            ));
                      },
                      child: const Text("Sınavı Tamamla"),
                    ),
                    OutlinedButton(
                      onPressed: isPressed!
                          ? index + 1 == sorular4.length
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
                      child: Text(index + 1 == sorular4.length
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