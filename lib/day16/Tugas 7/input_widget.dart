import 'package:flutter/material.dart';
import 'package:ppkd_b4_sofyan/day16/Tugas%207/checkbox.dart';
import 'package:ppkd_b4_sofyan/day16/Tugas%207/date_picker.dart';
import 'package:ppkd_b4_sofyan/day16/Tugas%207/dropdown.dart';
import 'package:ppkd_b4_sofyan/day16/Tugas%207/switched.dart';
import 'package:ppkd_b4_sofyan/day16/Tugas%207/time_picker.dart';

class InputWidgetDay16 extends StatefulWidget {
  const InputWidgetDay16({super.key});

  @override
  State<InputWidgetDay16> createState() => _InputWidgetDay16State();
}

class _InputWidgetDay16State extends State<InputWidgetDay16> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    'Checkbox',
    'Switched',
    'Dropdown',
    'Date Picker',
    'Time Picker',
  ];

  static const List<Widget> _widgetOption = [
    CheckboxWidgetDay16(),
    SwitchWidgetDay16(),
    DropdownWidgetDay16(),
    DatePickerWidgetDay16(),
    TimePickerWidgetDay16(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tidak ada AppBar
      // Tapi biar tetap bisa buka Drawer, kita pakai Builder + IconButton
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header Drawer
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.grey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.widgets, color: Colors.black, size: 48),
                  SizedBox(height: 10),
                  Text(
                    'Menu Widget Day 16',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),

            // List menu drawer
            ListTile(
              leading: const Icon(Icons.check_box_outlined),
              title: const Text('Checkbox'),
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.toggle_on),
              title: const Text('Switched'),
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_drop_down_circle_outlined),
              title: const Text('Dropdown'),
              onTap: () {
                setState(() => _selectedIndex = 2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: const Text('Date Picker'),
              onTap: () {
                setState(() => _selectedIndex = 3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Time Picker'),
              onTap: () {
                setState(() => _selectedIndex = 4);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Konten utama
      body: SafeArea(
        child: Column(
          children: [
            // Tombol manual untuk buka Drawer
            Align(
              alignment: Alignment.topLeft,
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, size: 30, color: Colors.black87),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // buka drawer
                  },
                ),
              ),
            ),

            // Judul (boleh hapus kalau mau polos banget)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _titles[_selectedIndex],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Divider(),

            // Konten widget aktif
            Expanded(child: _widgetOption[_selectedIndex]),
          ],
        ),
      ),
    );
  }
}
