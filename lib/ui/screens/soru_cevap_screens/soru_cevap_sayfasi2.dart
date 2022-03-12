import 'package:ehliyet_hazirlik/ui/feature/soru_cevap.dart';
import 'package:flutter/material.dart';
import '../../../core/data/soru_listesi2.dart';

class SoruCevap2 extends StatelessWidget {
  const SoruCevap2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SoruCevaplar(sorular: sorular2);
  }
}
