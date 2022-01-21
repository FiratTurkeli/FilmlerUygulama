

class Filmler{
  late String film_id;
  late String film_ad;
  late int film_yil;
  late String film_resim;
  late String kategori_ad;
  late String yonetmen_ad;

  Filmler(this.film_id, this.film_ad, this.film_yil, this.film_resim,
      this.kategori_ad, this.yonetmen_ad);

  factory Filmler.fromJson(String key, Map<dynamic,dynamic> json){
    return Filmler(json["film_id"] as String,
        json["film_ad"] as String,
        json["film_yil"] as int,
        json["film_resim"] as String,
        json["kategori_ad"] as String,
        json["yonetmen_ad"] as String);
}}