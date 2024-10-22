import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/sign_in.dart';
import 'Pages/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gudang App',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage(),
        '/home': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


//perbaiki fungsi tambah barang sm edit
//kalau ada waktu bagusin lagi tampilan sm tambah ganti2 theme
//fungsi sm tampilan beda youtube vid


