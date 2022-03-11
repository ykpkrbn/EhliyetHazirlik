import 'package:flutter/material.dart';
import '../screens/homepage.dart';
import '../screens/skorlar_ekrani.dart';
import '../screens/soru_cevap_screens/soru_cevap_sayfasi.dart';
import '../screens/soru_cevap_screens/soru_cevap_sayfasi2.dart';
import '../screens/soru_cevap_screens/soru_cevap_sayfasi3.dart';
import '../screens/soru_cevap_screens/soru_cevap_sayfasi4.dart';
import '../screens/soru_cevap_screens/soru_cevap_sayfasi5.dart';
import '../screens/test_sec_ekrani.dart';

Map<String, Widget Function(BuildContext)> myRoute = {
  "/": (context) => const HomePage(),
  "/SkorlarEkrani": (context) => const SkorlarEkrani(),
  "/SoruCevap": (context) => const SoruCevap(),
  "/SoruCevap2": (context) => const SoruCevap2(),
  "/SoruCevap3": (context) => const SoruCevap3(),
  "/SoruCevap4": (context) => const SoruCevap4(),
  "/SoruCevap5": (context) => const SoruCevap5(),
  "/TestSecEkrani": (context) => const TestSecEkrani(),
};
