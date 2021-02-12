
import 'package:final_project/Screens/CreateEntry.dart';
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

        title: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Text ('Travella', style: TextStyle(fontSize: 20, color: Colors.deepPurple[200])),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0.0,

      ),

      body: Container(),

      floatingActionButton: Container(

        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreateEntry()));
            },
              child: Icon (Icons.add),
            backgroundColor: Colors.amber[200],)
          ],
        ),

      ),
    );
  }
}
