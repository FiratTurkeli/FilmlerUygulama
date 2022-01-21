  class Kategoriler {
  late String kategori_id;
  late String kategori_ad;

  Kategoriler(this.kategori_id, this.kategori_ad);

  factory Kategoriler.fromJson(String key, Map<dynamic,dynamic> json){
    return Kategoriler(key, json["kategori_ad"] as String);
  }
}