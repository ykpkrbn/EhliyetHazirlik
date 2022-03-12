import 'package:ehliyet_hazirlik/ui/feature/soru_cevap.dart';
import 'package:flutter/material.dart';
import '../../../core/data/soru_listesi.dart';

class SoruCevap extends StatelessWidget {
  const SoruCevap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SoruCevaplar(sorular: sorular);
  }
}
