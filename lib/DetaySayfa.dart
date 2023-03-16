import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  String veri;

  DetaySayfa({required this.veri});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay"),
      ),
      body: Center(
        child: Text(widget.veri, style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
