import 'package:filmler_uyg_firebase/FilmlerSayfa.dart';
import 'package:filmler_uyg_firebase/Kategoriler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,

      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  var refKategoriler = FirebaseDatabase.instance.reference().child("kategoriler");



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var refKategoriler = FirebaseDatabase.instance.reference().child("kategoriler");


  Future<List<Kategoriler>> tumKategorileriGoster() async {
    var kategoriListesi = <Kategoriler>[];
    return kategoriListesi;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("VİZYONDAKİ FİLMLER" , style: TextStyle(color: Colors.indigo, fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: StreamBuilder<Event>(
        stream: refKategoriler.onValue,
        builder: (context,event){
          if (event.hasData) {
            var kategoriListesi = <Kategoriler>[];
            var gelenDegerler = event.data!.snapshot.value;
            if (gelenDegerler != null) {
              gelenDegerler.forEach((key,nesne){
                var gelenKategori = Kategoriler.fromJson(key, nesne);
                kategoriListesi.add(gelenKategori);
              });
            }
            
            return ListView.builder(
                itemCount: kategoriListesi.length,
                itemBuilder: (context,indeks){
                  var kategori = kategoriListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FilmlerSayfa(kategori: kategori,)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45.0, right: 45.0, top: 8.0),
                      child: Card(
                        shadowColor: Colors.green,
                        elevation: 8,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),

                        color: Colors.lime,
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(kategori.kategori_ad , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.teal),)
                            ],
                          ),
                        ),
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
