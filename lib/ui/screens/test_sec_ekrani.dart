import 'package:ehliyet_hazirlik/ui/constant/renkler.dart';
import 'package:ehliyet_hazirlik/ui/widgets/my_container.dart';
import 'package:flutter/material.dart';

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
      "/SkorlarEkrani",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Ekranım", style: TextStyle(
          color: beyazRenk,
          fontSize: 30,
        ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: anaRenk,
      ),
      backgroundColor: anaRenk,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
            ),
            itemCount: secilenYon.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){Navigator.pushNamed(context, secilenYon[index]);},
                child: MyContainer(
                  color: ikinciRenk,
                  child: Text("Test ${index+1}", textAlign: TextAlign.center,
                  style: TextStyle(
                    color: beyazRenk,
                    fontSize: 20,
                  ),
                  ),
                ),
              );
            } ),
      ),
    );
  }

}
