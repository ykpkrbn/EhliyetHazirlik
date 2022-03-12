import 'package:ehliyet_hazirlik/ui/feature/soru_cevap.dart';
import 'package:flutter/material.dart';
import '../../../core/data/soru_listesi4.dart';

class SoruCevap4 extends StatelessWidget {
  const SoruCevap4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SoruCevaplar(sorular: sorular4);
  }
}
