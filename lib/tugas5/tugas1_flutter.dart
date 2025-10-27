import 'package:flutter/material.dart';

class ScaffoldWidgetDay7 extends StatelessWidget {
  const ScaffoldWidgetDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: Text("Profil Saya"), backgroundColor: Colors.green,),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start, // start
        mainAxisAlignment: MainAxisAlignment.center, // center

        children: [
          Text(
            "Nama lengkap: Sofyan Alamsyah",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),          // Text("A"),
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [Icon(Icons.location_on), 
            Text("Jakarta")],
          ),
          Text(
            "lagi belajar flutter di pkd nich",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
