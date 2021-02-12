import 'package:final_project/Screens/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // If Firebase App init, snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }

        // Connection Initialized - Firebase App is running
        if (snapshot.connectionState == ConnectionState.done) {
          return LoginPage();

        }

        // Connecting to Firebase - Loading
        return Scaffold(
          body: Center(
            child: Text(
              "Initialization App...",
            ),
          ),
        );
      },
    );
  }
}