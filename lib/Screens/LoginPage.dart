import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
          margin: EdgeInsets.all(50.0),

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

                            child: Text("Hello!", style: TextStyle(color: Colors.white, fontSize: 30),),
                          ),
                          Center(
                            child: Text("Welcome to Travella", style: TextStyle(color: Colors.white, fontSize: 18),),
                          ),
                          SizedBox(height: 40,),
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
                              style: TextStyle(color: Colors.white70),

                            ),
                          ),
                          SizedBox(height: 40,),


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
