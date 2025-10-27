import 'package:flutter/material.dart';
import 'package:ppkd_b4_sofyan/login/home_screen.dart';

class LoginScreenDay17 extends StatefulWidget {
  const LoginScreenDay17({super.key});
  static String routeName = '/login_screen17';

  @override
  State<LoginScreenDay17> createState() => _LoginDay13State();
}

class _LoginDay13State extends State<LoginScreenDay17> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff011B33),

      // SingleChildScrollView biar bisa discroll
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // BAGIAN ATAS + GAMBAR + TEKS
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Gambar latar belakang atas
                    Container(
                      width: double.infinity,
                      height: 355,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/loginatas.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Teks di atas gambar
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Welcome back to Estero. Have a good time',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //  FORM LOGIN
                // final _formKey = GlobalKey<FormState>();
                // SafeArea buildLayer() {
                // }
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TextFormField email
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Color(0xff999999),
                          ),
                          hintText: 'Your Email/Id',
                          hintStyle: TextStyle(color: Color(0xff999999)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff999999)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),

                      SizedBox(height: 20),

                      // TextFormField password
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Color(0xff999999),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Color(0xff999999)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff999999)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),

                      SizedBox(height: 20),

                      // Tombol "Forgot Password"
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(color: Color(0xff999999)),
                          ),
                        ),
                      ),

                      // TOMBOL LOGIN
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0B2F9F),
                            shape: RoundedRectangleBorder(),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 60),

                      //Garis pembatas OR
                      Row(
                        children: [
                          Expanded(
                            child: Divider(thickness: 1, color: Colors.white24),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'OR',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Divider(thickness: 1, color: Colors.white24),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),

                      //LOGIN DENGAN FACEBOOK & GMAIL
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff223a67),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text(
                                'Facebook',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff223a67),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text(
                                'Gmail',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
