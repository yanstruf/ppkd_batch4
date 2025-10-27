import 'package:flutter/material.dart';

class StateDay12 extends StatefulWidget {
  const StateDay12({super.key});

  @override
  State<StateDay12> createState() => _State2Day12State();
}

class _State2Day12State extends State<StateDay12> {
  bool showName = false;
  bool showFavorite = false;
  bool tampilDeskripsi = false;
  bool text = false;

  String name = 'Sofyan Alamsyah';
  String favorite = 'Disuka';

  num angka = 0;
  int angkasatu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                angka++;
              });
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                angka--;
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(title: Text('Halaman Interaksi')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(showName ? 'Nama Saya: $name' : ''),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  setState(() {
                    showName = !showName;
                  });
                },
                onLongPress: () {
                  print('Nama Saya: Sofyan Alamsyah');
                },
                child: Text(
                  'Tampilkan Nama',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            GestureDetector(
              onTap: () {
                setState(() {
                  showFavorite = !showFavorite;
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: showFavorite ? Colors.red : Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(height: 5),

                  if (showFavorite)
                    const Text(
                      '',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 175, 172, 172),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
            Text(showFavorite ? 'Disuka' : ''),
            SizedBox(child: Column(children: [
                ],
              )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsetsGeometry.all(2)),
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    setState(() {
                      tampilDeskripsi = !tampilDeskripsi;
                    });
                  },
                  child: Text(
                    tampilDeskripsi ? 'Sembunyikan' : 'Lihat selengkapnya',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),

                Center(
                  child: Text(angka.toString()),
                ), //Manggil floationbutton diatas

                if (tampilDeskripsi)
                  const Text(
                    'Aku bukan malas, cuma lagi mode hemat energi',
                    style: TextStyle(color: Colors.black),
                  ),
              ],
            ),
            //Inkwell
            Container(
              width: 150,
              height: 150,
              color: Colors.limeAccent,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      print('Kotak diSentuh');
                      text = !text;
                      setState(() {});
                    },
                    child: Center(child: Text(text ? 'haloo' : '')),
                  ),
                ),
              ),
            ), //Container inkwell

            SizedBox(height: 100),
            GestureDetector(
              onDoubleTap: () {
                print('Ditekan dua kali');
                setState(() {
                  angkasatu += 2;
                });
              },
              onLongPress: () {
                print('Tahan Lama');
                setState(() {
                  angkasatu += 3;
                });
              },
              onTap: () {
                print('ditekan sekali');
                setState(() {
                  angkasatu += 1;
                });
              },
              child: Text('Tekan Aku'),
            ),
            Center(child: Text('Jumlahnya : $angkasatu')),
          ],
        ),
      ),
    );
  }
}
