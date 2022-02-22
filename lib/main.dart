import 'package:ehliyet_hazirlik/ui/screens/homepage.dart';
import 'package:ehliyet_hazirlik/ui/screens/skorlar_ekrani.dart';
import 'package:ehliyet_hazirlik/ui/screens/soru_cevap_screens/soru_cevap_sayfasi.dart';
import 'package:ehliyet_hazirlik/ui/screens/soru_cevap_screens/soru_cevap_sayfasi2.dart';
import 'package:ehliyet_hazirlik/ui/screens/test_sec_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ehliyete Hazırlık",
      initialRoute: "/",
      routes: {
        "/" : (context) => const HomePage(),
        "/SkorlarEkrani" : (context) =>const SkorlarEkrani(),
        "/SoruCevap" : (context) =>const SoruCevap(),
        "/SoruCevap2" : (context) =>const SoruCevap2(),
        "/TestSecEkrani" : (context) =>const TestSecEkrani(),
      },
    );
  }
}
