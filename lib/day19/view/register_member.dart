import 'package:flutter/material.dart';
import 'package:ppkd_b4_sofyan/day18/tampilan_login.dart';
import 'package:ppkd_b4_sofyan/day19/database/db_helper.dart';
import 'package:ppkd_b4_sofyan/day19/model/user_model.dart';
// import 'package:ppkd_b4_sofyan/login/home_screen.dart';

class RegisterMemberDay19 extends StatefulWidget {
  const RegisterMemberDay19({super.key});

  @override
  State<RegisterMemberDay19> createState() => _RegisterMemberDay19State();
}

class _RegisterMemberDay19State extends State<RegisterMemberDay19> {
  // form key already declared above
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _asalkotaController = TextEditingController();
  final _nomorHPController = TextEditingController();

  final db = DbHelper();
  List<UserModel> _listUser = [];

  bool isVisibility = false;
  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    // No database method available here; initialize with an empty list.
    setState(() {
      _listUser = [];
    });
  }

  Future<void> _simpanData() async {
    if (_formKey.currentState!.validate()) {
      final newUser = UserModel(
        name: _nameController.text,
        email: _emailController.text,
        hp: int.tryParse(_nomorHPController.text),
        asalkota: _asalkotaController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  // register() async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => HomeScreen()),
  //   );
  // }

  final _formKey = GlobalKey<FormState>();
  SafeArea buildLayer() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Daftar calon haji",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  height(12),
                  Text(
                    "Registrasi dulu bray",
                    style: TextStyle(color: Colors.white),
                    // style: TextStyle(fontSize: 14, color: AppColor.gray88),
                  ),
                  height(24),
                  buildTitle("Nama"),
                  height(12),
                  buildTextField(
                    hintText: "Masukan nama anda",
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),

                  height(16),
                  buildTitle("Email Address"),
                  height(12),
                  buildTextField(
                    hintText: "Enter your email",
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      } else if (!value.contains('@')) {
                        return "Email tidak valid";
                      } else if (!RegExp(
                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                      ).hasMatch(value)) {
                        return "Format Email tidak valid";
                      }
                      return null;
                    },
                  ),

                  height(16),
                  buildTitle("Asal Kota"),
                  height(12),
                  buildTextField(
                    hintText: "Asal kota anda",
                    controller: _asalkotaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Asal kota tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  height(16),
                  buildTitle("No HP"),
                  height(12),
                  buildTextField(
                    hintText: "Masukan nomor HP",
                    isPassword: true,
                    controller: _nomorHPController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "No HP tidak boleh kosong";
                      } else if (value.length < 6) {
                        return "No HP minimal 6 karakter";
                      }
                      return null;
                    },
                  ),
                  height(24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print(_emailController.text);
                          final UserModel data = UserModel(
                            name: _nameController.text,
                            email: _emailController.text,
                            asalkota: _asalkotaController.text,
                            hp: int.tryParse(_nomorHPController.text),
                          );
                          await DbHelper.registerUser(data);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Register Berhasil")),
                          );
                          // PreferenceHandler.saveLogin(true);
                          // Navigator.pop(context);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => HomeScreen()),
                          // );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Validation Error"),
                                content: Text("Please fill all fields"),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text("Ga OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  height(20),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomeScreen()),
                      // );
                    },
                    child: Text("Ke Day13"),
                  ),
                  height(16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        // style: TextStyle(fontSize: 12, color: AppColor.gray88),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginDay13(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            // color: AppColor.blueButton,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
                                    (user.name?.isNotEmpty ?? false)
                                        ? user.name![0].toUpperCase()
                                        : '?',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(user.name ?? ''),
                                subtitle: Text(
                                  "${user.email}\n${user.hp ?? ''} - ${user.asalkota}",
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.cyan,
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                  // color: AppColor.gray88,
                ),
              )
            : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
      ],
    );
  }
}
