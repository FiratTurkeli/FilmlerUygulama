import 'package:filmler_uyg_firebase/Filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  late Filmler film;


  DetaySayfa({required this.film});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.film.film_ad),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(

          child: Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Card(
              color: Colors.lime,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Card(
                    color: Colors.indigo,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network("http://kasimadalan.pe.hu/filmler/resimler/${widget.film.film_resim}"),
                    ),
                  ),
                  Card(
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.film.film_ad, style: TextStyle(fontSize: 30, color: Colors.white),),
                    ),
                  ),
                  Card(
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.film.yonetmen_ad, style: TextStyle(fontSize: 30, color: Colors.white),),
                    ),
                  ),
                  Card(
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.film.film_yil.toString(), style: TextStyle(fontSize: 30, color: Colors.white),),
                    ),
                  )




                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
