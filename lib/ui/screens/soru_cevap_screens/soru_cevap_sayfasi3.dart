import 'package:ehliyet_hazirlik/ui/feature/soru_cevap.dart';
import 'package:flutter/material.dart';
import '../../../core/data/soru_listesi3.dart';

class SoruCevap3 extends StatelessWidget {
  const SoruCevap3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SoruCevaplar(sorular: sorular3);
  }
}
