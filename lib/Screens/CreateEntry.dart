import 'package:flutter/material.dart';

class CreateEntry extends StatefulWidget {
  @override
  _CreateEntryState createState() => _CreateEntryState();
}

class _CreateEntryState extends State<CreateEntry> {

  String title, desc;

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
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.add_circle_sharp, color: Colors.amber[200],),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Container(height: 160,
              decoration: BoxDecoration(
                  color: Colors.amber[200], borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width,
              child: Icon(Icons.add_a_photo),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Title"),
                    onChanged: (val){
                      title = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Description"),
                    onChanged: (val){
                      desc = val;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
