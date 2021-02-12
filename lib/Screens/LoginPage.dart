import 'dart:ui';
import 'package:final_project/Screens/HomePage.dart';
import 'package:final_project/Screens/SignUpPage.dart';
import 'package:flutter/material.dart';



void gotoHomePage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage()
  ));
}

void gotoSignUpPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpPage()
  ));
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email = "";
  String _password = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.amberAccent,
                  Colors.deepPurpleAccent,
                ]
            )

        ),
          child: Container(
          margin: EdgeInsets.all(30.0),

          child: Column(
            children: [

              SizedBox(height: 80,
              ),
              Expanded (
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                    )
                  ),

                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Center(

                            child: Text("Hello!", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                          Center(
                            child: Text("Welcome to Travella", style: TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic ),),
                          ),

                          Container(

                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[200])
                                )
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Enter your email",
                                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                                  border: InputBorder.none
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(color: Colors.grey[200])
                                )
                            ),

                            child: TextField(
                              decoration: InputDecoration(
                            hintText: "Enter your password",
                            hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                            border: InputBorder.none
                            ),
                          ),
                        ),
                          SizedBox(height: 40,),
                          Center(
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.black54),

                            ),
                          ),
                          SizedBox(height: 20,),

                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: RaisedButton( onPressed: (){gotoHomePage(context);},
                              child: Text('Login'),
                              color: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.deepPurpleAccent)
                              ),


                            ),
                          ),
                          SizedBox(height: 20,),

                          Padding(
                            padding: const EdgeInsets.only(left:10.0, right: 10.0),
                            child: Center(
                              child: Text("If you are new, join us!",
                                style: TextStyle(color: Colors.black54, fontSize: 14, fontStyle: FontStyle.italic ),),
                            ),
                          ),
                          SizedBox(height: 10,),

                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: RaisedButton( onPressed: (){gotoSignUpPage(context);},
                              child: Text('Sign Up',
                              style: TextStyle(color: Colors.black54) ),
                              color: Colors.amber[200],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.amber[200])
                              ),

                            ),
                          ),



                        ],

                      ),




                ),

              )
              )
            ],
          ),

          ),
        )
      );
  }
}
