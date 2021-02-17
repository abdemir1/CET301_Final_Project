
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Screens/CreateEntry.dart';
import 'package:final_project/Screens/ProfilePage.dart';
import 'package:final_project/Screens/ProfilePage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/Services/blogs.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//deneme
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  List<Blogs> blogsData = [];

  Future _getBlogData() async {
    DatabaseReference reference = await FirebaseDatabase.instance.reference();
    reference.child("Blogs").once().then((DataSnapshot snapshot){
      var keys = snapshot.value.keys;
      var data = snapshot.value;

      blogsData.clear();

      for (var singleKey in keys) {
        Blogs blogModel = Blogs(
          image: data[singleKey]["image"],
          title: data[singleKey]["title"],
          desc: data[singleKey]["desc"],
        );
        setState(() {
          blogsData.add(blogModel);
          blogsData.reversed;
        });
        reference.keepSynced(true);
      }
    });
  }

//deneme
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Text ('Travella', style: TextStyle(fontSize: 20, color: Colors.deepPurple[400])),
        ),
        backgroundColor: Colors.amber[200]
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(

          physics: BouncingScrollPhysics(),
           children: [
          SingleItem(),
             SingleItem(),
             SingleItem(),
             SingleItem(),
      ],
    ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          backgroundColor: Colors.amber[100],
          selectedItemColor: Colors.deepPurple,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_emoticon),
              label: 'profile',
            )
          ],
      onTap: (index){
            setState(() {
              _currentIndex = index;

              if(_currentIndex==1){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              }
              else
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }
            );
      },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

class SingleItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10.0),
      ),

      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  image: NetworkImage('https://static.toiimg.com/photo/69577255/alaska.jpg?width=748&resize=4'),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text ('title', style: GoogleFonts.montserrat(color: Colors.amber, fontSize: 22),),
                SizedBox(height: 10.0),
                Text ('desc', style: GoogleFonts.montserrat(color: Colors.amber, fontSize: 16),),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
