
class SoruModeli {
  String? soru;
  String? resim;
  Map<String, bool>? cevap;

  SoruModeli(this.soru, this.cevap,{this.resim});
}

class Scorelar {
  final int? id;
  final int score;
  final DateTime tarih;

  Scorelar({this.id, required this.score, required this.tarih});

  Map<String, dynamic> toMap() {
    return ({"id": id, "score": score, "tarih": tarih.toString()});
  }
}
