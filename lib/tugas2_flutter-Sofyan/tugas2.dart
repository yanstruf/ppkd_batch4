import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Lengkap"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2021/03/05/22/40/dinosaur-6072468_960_720.png',
            ),
          ),
          Text(
            'Sofyan Alamsyah',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 8),
                  Text(
                    'alamsyahsofyan88@gmail.com',
                    // textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Icon(Icons.phone),
                  SizedBox(width: 8),
                  Text('0812-3456-7890', textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  child: Center(
                    child: Text(
                      'Postingan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  child: Center(
                    child: Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Prima di iniziare a usare i video abbiamo provato molti altri sistemi di promozione tradizionali, come pubblicità sulla carta stampata, qualche pubblicità online, tour di promozione di libri, pubblicità tramite posta ordinaria, Voglio fare un film su product placement, marketing e pubblicità, e che sia interamente finanziato da product placement, marketing e pubblicità',
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container(color: Colors.white)),
          Container(height: 40, color: Colors.lightGreenAccent),
        ],
      ),
    );
  }
}
