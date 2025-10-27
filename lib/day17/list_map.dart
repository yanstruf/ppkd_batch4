import 'package:flutter/material.dart';

class ListMapDay17 extends StatefulWidget {
  const ListMapDay17({super.key});

  @override
  State<ListMapDay17> createState() => _ListMapDay17State();
}

class _ListMapDay17State extends State<ListMapDay17> {
  final List<Map<String, dynamic>> namaKategori = [
    {
      'name': 'Buah-buahan',
      'price': 10000,
      'condition': 'Segar',
      'icons': Icons.apple,
    },
    {
      'name': 'Sayuran',
      'price': 20000,
      'condition': 'Segar',
      'icons': Icons.grass,
    },
    {
      'name': 'Elektronik',
      'price': 10000,
      'condition': 'Baru',
      'icons': Icons.ac_unit,
    },
    {
      'name': 'Pakaian pria',
      'price': 10000,
      'condition': 'Baru',
      'icons': Icons.man,
    },
    {
      'name': 'Pakaian wanita',
      'price': 10000,
      'condition': 'baru',
      'icons': Icons.woman,
    },
    {
      'name': 'Alat tulis kantor',
      'price': 10000,
      'condition': 'Segar',
      'icons': Icons.rule,
    },
    {
      'name': 'Buku majalah',
      'price': 10000,
      'condition': 'Segar',
      'icons': Icons.book,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: namaKategori.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(namaKategori[index]['icons']),
            title: Text(namaKategori[index]['name']),
            subtitle: Text(
              'Harga: ${namaKategori[index]['price']}, Kondisi: ${namaKategori[index]['condition']}',
            ),
          );
        },
      ),
    );
  }
}
