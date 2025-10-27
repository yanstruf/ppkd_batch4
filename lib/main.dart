import 'package:flutter/material.dart';
// import 'package:ppkd_b4_sofyan/login/login.dart';
// import 'package:ppkd_b4_sofyan/day19/view/register_member.dart';
// import 'package:ppkd_b4_sofyan/project_one/view/form_pendaftaran.dart';
import 'package:ppkd_b4_sofyan/project_one/login_screen.dart';
// import 'package:ppkd_b4_sofy/day18/tampilan_login.dart';
// import 'package:ppkd_b4_sofy/day18/formulir.dart';
// import 'package:ppkd_b4_sofy/day17/list_model.dart';
// import 'package:ppkd_b4_sofy/day17/list_map.dart';
// import 'package:ppkd_b4_sofy/day17/list_view.dart';
// import 'package:ppkd_b4_sofy/day16/Tugas 8/navbar.dart';
// import 'package:ppkd_b4_sofy/day16/input_widget.dart';
// import 'package:ppkd_b4_sofy/day16/switched.dart';
// import 'package:ppkd_b4_sofy/day16/dropdown.dart';
// import 'package:ppkd_b4_sofy/day16/date_picker.dart';
// import 'package:ppkd_b4_sofy/day16/time_picker.dart';

// import 'package:ppkd_b4_sofy/login/home_screen.dart';

// import 'package:ppkd_b4_sofy/day13/login_day13.dart';

// import 'package:ppkd_b4_sofy/tugas5/tugas5_flutter.dart';
// import 'package:ppkd_b4_sofy/tugas3dan4/tugas4.dart';

// import 'package:ppkd_b4_sofy/tugas1_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // debugShowCheckedModeBanner: false,
        // home: HomeScreen(),
        // title: 'Flutter Demo',
        // initialRoute: '/home',
        // routes: {'/home': (context) => HomeScreen()},
        // theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const LoginScreen(),
    );
  }
}
