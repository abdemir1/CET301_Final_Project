import 'package:final_project/Screens/CreateEntry.dart';
import 'package:final_project/Screens/HomePage.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int _currentIndex = 1;
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
      body: SingleChildScrollView(

        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber[200],
          ),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.deepPurple[50],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 48,
                                backgroundImage:
                                NetworkImage('https://images.unsplash.com/photo-1494023464169-ca920b2ca85f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1012&q=80'),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(height: 20,),
                                    Text('Lorem Ipsum', style: TextStyle(fontSize: 24, color: Colors.deepPurple, fontWeight: FontWeight.w500,),
                                    ),
                                    Text('Turkey'),
                                    SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('1', style: TextStyle(fontSize: 24, color: Colors.amber,),
                                  ),
                                  SizedBox(height: 4,),
                                  Text('Posts', style: TextStyle(fontSize: 16,),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('233', style: TextStyle(fontSize: 24, color: Colors.amber,),
                                  ),
                                  SizedBox(height: 4,),
                                  Text('Followers', style: TextStyle(fontSize: 16,),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('123', style: TextStyle(fontSize: 24, color: Colors.amber,),
                                  ),
                                  SizedBox(height: 4,),
                                  Text('Following', style: TextStyle(fontSize: 16,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Divider(height: 2, color: Colors.grey,),
                          SizedBox(height: 16,),
                          Center(
                            child: Text('Posts', style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 300,
                      child: SingleItem(),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

          if(_currentIndex==0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
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
