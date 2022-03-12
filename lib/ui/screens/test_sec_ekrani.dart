import 'package:ehliyet_hazirlik/ui/constant/renkler.dart';
import 'package:ehliyet_hazirlik/ui/widgets/my_container.dart';
import 'package:flutter/material.dart';

import '../constant/image.dart';

class TestSecEkrani extends StatefulWidget {
  const TestSecEkrani({Key? key}) : super(key: key);

  @override
  State<TestSecEkrani> createState() => _TestSecEkraniState();
}

class _TestSecEkraniState extends State<TestSecEkrani> {
  late List<String> secilenYon;

  @override
  void initState() {
    super.initState();
    secilenYon = [
      "/SoruCevap",
      "/SoruCevap2",
      "/SoruCevap3",
      "/SoruCevap4",
      "/SoruCevap5",
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test Ekranım",
          style: TextStyle(
            color: beyazRenk,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: anaRenk,
      ),
      backgroundColor: anaRenk,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size < 700
                  ? size < 500
                      ? size < 300
                          ? 1
                          : 2
                      : 3
                  : 4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 2,
            ),
            itemCount: secilenYon.length,
            itemBuilder: (context, index) {
              return MyContainer(
                color: ikinciRenk,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, secilenYon[index]);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 8,
                          child: ResimlerYolu().uygulamam),
                      Text(
                        "Deneme ${index + 1}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: beyazRenk,
                          // fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
