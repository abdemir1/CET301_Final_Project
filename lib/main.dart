
import 'package:google_fonts/google_fonts.dart';

import 'Screens/LoginPage.dart';
import 'Screens/LandingPage.dart'; // might delete
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        )
      ),

      home: LandingPage(), // might become login
    );
  }
}