import 'package:ehliyet_hazirlik/ui/screens/test_sec_ekrani.dart';
import 'package:flutter/material.dart';
import '../constant/renkler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anaRenk,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Ehliyet \nSınavına \nHazırlık",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 54,
                    fontWeight: FontWeight.bold,
                    color: beyazRenk),
              ),
              const SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestSecEkrani(),
                      ));
                },
                color: ikinciRenk,
                shape: const StadiumBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Test Yapmaya Başla",
                    style: TextStyle(
                      fontSize: 20,
                      color: beyazRenk,
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context,
                      "/SkorlarEkrani");
                },
                color: ikinciRenk,
                shape: const StadiumBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Skorlarım",
                    style: TextStyle(
                      fontSize: 20,
                      color: beyazRenk,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
