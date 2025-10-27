import 'package:flutter/material.dart';
import 'package:ppkd_b4_sofyan/project_one/database/db_helper.dart';
import 'package:ppkd_b4_sofyan/project_one/model/user_model.dart';

class FormPendaftaran extends StatefulWidget {
  const FormPendaftaran({super.key});

  @override
  State<FormPendaftaran> createState() => _FormPendaftaranState();
}

class _FormPendaftaranState extends State<FormPendaftaran> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _kotaController = TextEditingController();

  final db = DBHelper();
  List<UserModel> _listUser = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final data = await db.getUsers();
    setState(() {
      _listUser = data;
    });
  }

  Future<void> _simpanData() async {
    if (_formKey.currentState!.validate()) {
      final newUser = UserModel(
        nama: _namaController.text,
        email: _emailController.text,
        noHp: _noHpController.text,
        kota: _kotaController.text,
      );

      await db.insertUser(newUser);
      _namaController.clear();
      _emailController.clear();
      _noHpController.clear();
      _kotaController.clear();
      Future<void> loadUser() async {
        final data = await db.getUsers();
        print('Jumlah data : ${data.length}');
        for (var u in data) {
          print('user : ${u.nama}, ${u.email}, ${u.noHp}, ${u.kota}');
        }
        setState(() {
          _listUser = data;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007C82),
      appBar: AppBar(
        title: const Text("Form Pendaftaran"),
        backgroundColor: const Color(0xFF007C82),
        foregroundColor: const Color.fromARGB(255, 233, 239, 240),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.app_registration)),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Daftar Peserta Satu Digital",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildInput("Nama", _namaController),
                  _buildInput(
                    "Email",
                    _emailController,
                    validator: (v) {
                      if (v == null || v.isEmpty) return "Email wajib diisi";
                      if (!v.contains('@')) return "Email tidak valid";
                      return null;
                    },
                  ),
                  _buildInput("Nomor HP", _noHpController),
                  _buildInput("Asal Kota", _kotaController),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _simpanData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Divider(color: Colors.white54),
            const SizedBox(height: 10),

            const Text(
              "Peserta Terdaftar:",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            _listUser.isEmpty
                ? const Text(
                    "Belum ada peserta.",
                    style: TextStyle(color: Colors.white),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _listUser.length,
                    itemBuilder: (context, index) {
                      final user = _listUser[index];
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: Text(
                              user.nama[0].toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(user.nama),
                          subtitle: Text(
                            "${user.email}\n${user.noHp} - ${user.kota}",
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(
    String label,
    TextEditingController controller, {
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        validator:
            validator ??
            (v) => (v == null || v.isEmpty) ? "$label wajib diisi" : null,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
