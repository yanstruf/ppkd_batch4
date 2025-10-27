import 'package:flutter/material.dart';

class ListViewWidgetDay10 extends StatelessWidget {
  const ListViewWidgetDay10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hola Pren',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama'),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukan nama lu',
                  hintStyle: TextStyle(color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email'),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email lu co',
                  hintStyle: TextStyle(color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('No. HP'),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '0812*******',
                  hintStyle: TextStyle(color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Deskripsi'),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Deskripsikan diri lu',
                  hintStyle: TextStyle(color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ListTile(
            leading: SizedBox(
              width: 50,
              child: Image.asset(
                'assets/images/meme1.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text('Paket Meme 1'),
            subtitle: Text('Rp 1.000.000'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: SizedBox(
              width: 50,
              child: Image.asset(
                'assets/images/meme2.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text('Paket Meme 2'),
            subtitle: Text('Rp 5.000.000'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: SizedBox(
              width: 50,
              child: Image.asset(
                'assets/images/meme3.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text('Paket Meme 3'),
            subtitle: Text('Rp 10.000.000'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: SizedBox(
              width: 50,
              child: Image.asset(
                'assets/images/meme4.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text('Paket Meme 4'),
            subtitle: Text('Rp 20.000.000'),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: SizedBox(
              width: 50,
              child: Image.asset(
                'assets/images/meme5.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text('Paket Meme Gibran'),
            subtitle: Text('Rp 5.000.000.000'),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
