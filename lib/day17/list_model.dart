import 'package:flutter/material.dart';
import 'package:ppkd_b4_sofyan/day17/models/kategori_model.dart';

class ListModelDay17 extends StatefulWidget {
  const ListModelDay17({super.key});

  @override
  State<ListModelDay17> createState() => _ListModelDay17State();
}

class _ListModelDay17State extends State<ListModelDay17> {
  final List<KategoriModel> namaKategori = [
    KategoriModel(
      name: 'Buah-buahan',
      image: 'assets/images/buah.jpg',
      backgroundColor: Colors.red[100],
      description: 'Berbagai macam buah segar dan berkualitas.',
    ),
    KategoriModel(
      name: 'Sayuran',
      image: 'assets/images/sayur.jpg',
      backgroundColor: Colors.green[100],
      description: 'Sayuran segar untuk kebutuhan harian Anda.',
    ),
    KategoriModel(
      name: 'Elektronik',
      image: 'assets/images/elektronik.jpg',
      backgroundColor: Colors.blue[100],
      description: 'Perangkat elektronik terbaru dengan teknologi canggih.',
    ),
    KategoriModel(
      name: 'Elektronik',
      image: 'assets/images/elektronik.jpg',
      backgroundColor: Colors.blue[100],
      description: 'Perangkat elektronik terbaru dengan teknologi canggih.',
    ),
    KategoriModel(
      name: 'Elektronik',
      image: 'assets/images/elektronik.jpg',
      backgroundColor: Colors.blue[100],
      description: 'Perangkat elektronik terbaru dengan teknologi canggih.',
    ),
    KategoriModel(
      name: 'Elektronik',
      image: 'assets/images/elektronik.jpg',
      backgroundColor: Colors.blue[100],
      description: 'Perangkat elektronik terbaru dengan teknologi canggih.',
    ),
    KategoriModel(
      name: 'Buah-buahan',
      image: 'assets/images/buah.jpg',
      backgroundColor: Colors.red[100],
      description: 'Berbagai macam buah segar dan berkualitas.',
    ),
    KategoriModel(
      name: 'Buah-buahan',
      image: 'assets/images/buah.jpg',
      backgroundColor: Colors.red[100],
      description: 'Berbagai macam buah segar dan berkualitas.',
    ),
    KategoriModel(
      name: 'Buah-buahan',
      image: 'assets/images/buah.jpg',
      backgroundColor: Colors.red[100],
      description: 'Berbagai macam buah segar dan berkualitas.',
    ),
    KategoriModel(
      name: 'Sayuran',
      image: 'assets/images/sayur.jpg',
      backgroundColor: Colors.green[100],
      description: 'Sayuran segar untuk kebutuhan harian Anda.',
    ),
    KategoriModel(
      name: 'Sayuran',
      image: 'assets/images/sayur.jpg',
      backgroundColor: Colors.green[100],
      description: 'Sayuran segar untuk kebutuhan harian Anda.',
    ),
    KategoriModel(
      name: 'Sayuran',
      image: 'assets/images/sayur.jpg',
      backgroundColor: Colors.green[100],
      description: 'Sayuran segar untuk kebutuhan harian Anda.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: namaKategori.length,
        itemBuilder: (BuildContext context, int index) {
          final kategori = namaKategori[index];
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: kategori.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(kategori.image),
            ),
            title: Text(kategori.name),
            subtitle: Text('item.description'),
          );
        },
      ),
    );
  }
}
