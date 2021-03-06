import 'package:ehliyet_hazirlik/ui/screens/sonuc_ekrani.dart';
import 'package:flutter/material.dart';
import '../constant/renkler.dart';

class SoruCevaplar extends StatefulWidget {
  List sorular;
  SoruCevaplar({Key? key, required this.sorular}) : super(key: key);

  @override
  _SoruCevaplarState createState() => _SoruCevaplarState();
}

class _SoruCevaplarState extends State<SoruCevaplar>
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
          itemCount: widget.sorular.length,
          itemBuilder: (context, index) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Soru ${index + 1} / ${widget.sorular.length}",
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
                  widget.sorular[index].soru!,
                  style: TextStyle(
                    color: beyazRenk,
                    fontSize: Theme.of(context).textTheme.headline6?.fontSize,
                  ),
                ),
                const SizedBox(height: 35),
                widget.sorular[index].resim == null
                    ? const Text("")
                    : Image.asset(widget.sorular[index].resim!),
                widget.sorular[index].resim == null
                    ? const Text("")
                    : const SizedBox(height: 35),
                for (int i = 0; i < widget.sorular[index].cevap!.length; i++)
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
                              if (widget.sorular[index]
                                  .cevap!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                yesilRenk;
                                score += 2;
                                debugPrint("T??klan??lan index : ${i}");
                                debugPrint("score : $score");
                                setState(() {});
                              }
                            },
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            color: !isPressed!
                                ? ikinciRenk
                                : widget.sorular[index]
                                .cevap!
                                .entries
                                .toList()[i]
                                .value
                                ? yesilRenk
                                : kirmiziRenk,
                            shape: const StadiumBorder(),
                            child: FittedBox(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                                child:
                                Text(widget.sorular[index].cevap!.keys.toList()[i],
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
                      //           ? sorular[index]
                      //                   .cevap!
                      //                   .entries
                      //                   .toList()[i]
                      //                   .value
                      //               ? const Icon(Icons.done)
                      //               : const Icon(Icons.architecture_sharp)
                      //           : const Text(""),
                      //
                      //       /// Buray?? reklamla yap
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SonucEkrani(score),
                            ));
                      },
                      child: const Text("S??nav?? Tamamla"),
                    ),
                    OutlinedButton(
                      onPressed: isPressed!
                          ? index + 1 == widget.sorular.length
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
                      child: Text(index + 1 == widget.sorular.length
                          ? "S??nav?? Tamamla"
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
