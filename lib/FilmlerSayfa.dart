import 'package:filmler_uyg_firebase/DetaySayfa.dart';
import 'package:filmler_uyg_firebase/Filmler.dart';
import 'package:filmler_uyg_firebase/Kategoriler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FilmlerSayfa extends StatefulWidget {

  late Kategoriler kategori;

  FilmlerSayfa({required this.kategori});

  @override
  _FilmlerSayfaState createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {

  var refFilmler = FirebaseDatabase.instance.reference().child("filmler");

  Future<List<Filmler>> filmleriGoster() async {
    var filmlerListesi = <Filmler>[];
    return filmlerListesi;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.kategori.kategori_ad),
        centerTitle: true,
      ),
      body:  StreamBuilder<Event>(
        stream: refFilmler.orderByChild("kategori_ad").equalTo(widget.kategori.kategori_ad).onValue,
        builder: (context,event){
          if (event.hasData) {
            var filmlerListesi = <Filmler>[];
            var gelenDegerler = event.data!.snapshot.value;
            if (gelenDegerler != null) {
              gelenDegerler.forEach((key,nesne){
                var gelenFilm = Filmler.fromJson(key, nesne);
                filmlerListesi.add(gelenFilm);
              });
            }


            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5
              ),
                itemCount: filmlerListesi.length,
                itemBuilder: (context,indeks){
                  var film = filmlerListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film: film,)));
                    },
                    child: Card(
                      shadowColor: Colors.green,
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),

                      color: Colors.lime,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network("http://kasimadalan.pe.hu/filmler/resimler/${film.film_resim}"),
                          ),
                          Text(film.film_ad , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.teal),)
                        ],
                      ),
                    ),
                  );

                }
            );


          }  else{
            return Center();
          }
        },
      )

    );
  }
}
