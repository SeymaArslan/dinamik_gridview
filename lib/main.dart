import 'package:dinamik_gridview/DetaySayfa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ulkeler = ["Türkiye","Almanya","Hollanda","İngiltere","İtalya"];  // veri kümemiz

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinamik GridView"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // satırdaki item sayısını belirtiyoruz
          childAspectRatio: 2 / 1, // genişlik ve yükseklik oranı veriyoruz
        ),
        itemCount: ulkeler.length,
        itemBuilder: (context, indeks){
          // döngü gibi çalışıyor itemCount uzunluk indeks ise tek tek gelen verileri getiriyor
          return GestureDetector(
            onTap: (){
              // print("${ulkeler[indeks]} kartla tıklandı");
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(veri: ulkeler[indeks])));
            },
            child: Card(  // veri kadar oluşacak yapı
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row( // card içerisinde widgetlar satır satır görünecek
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        print("Text ile ${ulkeler[indeks]} seçildi");
                      },
                      child: Text(ulkeler[indeks], style: TextStyle(color: Colors.indigo),)
                    ),
                    Spacer(),

                    /*TextButton(  ----------------------- önceki hali ---------------****----------------------
                        onPressed: (){
                          print("Button ile ${ulkeler[indeks]} seçildi");
                        },
                        child: Text("Ülke Seç", style: TextStyle(color: Colors.deepOrangeAccent),),
                    ),  */
                    PopupMenuButton(
                      child: Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1, child: Text("Sil"),
                        ),
                        PopupMenuItem(
                          value: 2, child: Text("Güncelle"),
                        ),
                      ],
                      onSelected: (menuItemValue){
                        if(menuItemValue == 1)  {
                          print("${ulkeler[indeks]} silindi");
                        }
                        if(menuItemValue == 2)  {
                          print("${ulkeler[indeks]} güncellendi");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
