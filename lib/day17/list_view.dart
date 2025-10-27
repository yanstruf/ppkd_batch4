import 'package:flutter/material.dart';

class ListViewDay17 extends StatefulWidget {
  const ListViewDay17({super.key});

  @override
  State<ListViewDay17> createState() => _ListViewDay17State();
}

class _ListViewDay17State extends State<ListViewDay17> {
  final List<String> namaKategori = [
    'Buah-buahan',
    'Sayuran',
    'Elektronik',
    'Pakaian pria',
    'Pakaian wanita',
    'Alat tulis kantor',
    'Buku majalah',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: namaKategori.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(namaKategori[index]));
        },
      ),
    );
  }
}
