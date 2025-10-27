import 'package:flutter/material.dart';
import 'package:ppkd_b4_sofyan/login/home_screen.dart';
import 'package:ppkd_b4_sofyan/tugas2_flutter-Sofyan/tugas2.dart';
// import 'package:ppkd_b4_sofyan/tugas2_flutter-sofyanan/tugas2.dart';
import 'package:ppkd_b4_sofyan/tugas5/tugas1_flutter.dart';
import 'package:ppkd_b4_sofyan/tugas5/tugas5_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // Daftar halaman (tab)
  static final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const Tugas2(),
    const ScaffoldWidgetDay7(),
    const StateDay12(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan tombol Drawer
      appBar: AppBar(
        title: const Text('Main Screen'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),

      // Tambah Drawer di sisi kiri
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Boskuh sofyan'),
              accountEmail: Text('sofyan@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/4140/4140048.png',
                ),
              ),
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search / Tugas 2'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile / Tugas 5'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login / Tugas 1'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Logout clicked')));
              },
            ),
          ],
        ),
      ),

      // Body pakai animasi halus antar halaman
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.2, 0), // geser dari kanan dikit
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: _widgetOptions[_selectedIndex],
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // biar bisa lebih dari 3 item
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Tugas 2'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tugas 5'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Tugas 1'),
        ],
      ),
    );
  }
}
