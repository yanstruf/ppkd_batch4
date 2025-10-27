import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.nama, required this.domisili});
  final String nama;
  final String domisili;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pendaftaran'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Center(
        child: Text(
          'Terima_kasih ${widget.nama} dari ${widget.domisili} telah mendaftar',
        ),
      ),
    );
  }
}
