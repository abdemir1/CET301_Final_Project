
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text ('Travella', style: TextStyle(fontSize: 22, color: Colors.deepPurple[200])),
            Icon (Icons.add_circle_sharp),

          ],

        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,

      ),

      body: SafeArea(

        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          children: <Widget>[
            Padding(padding: EdgeInsets.only(right: 100, left: 20),
              child: Text(
              'Find a place in Travella!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ),
            SizedBox(height: 20),

        ]
        )
      ),
    );
  }
}
