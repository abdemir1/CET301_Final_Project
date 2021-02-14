import 'dart:io';
import 'dart:core';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Services/crud.dart';

import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class CreateEntry extends StatefulWidget {
  @override
  _CreateEntryState createState() => _CreateEntryState();
}

class _CreateEntryState extends State<CreateEntry> {

  String title, desc;
  final picker = ImagePicker();
  File selectedImage;

  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();

  Future getImage() async {

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> uploadBlog() async{

    if (selectedImage != null){

      setState(() {
        _isLoading = true;
      });
      Reference storage = FirebaseStorage.instance.ref().child("blogImages").child("${randomAlphaNumeric(9)}.jpg");

      final UploadTask task = storage.putFile(selectedImage);

      var imageUrl;
      await task.whenComplete(() async {
        try {
          imageUrl = await storage.getDownloadURL();
        } catch (onError) {
          print("Error");
        }

        print(imageUrl);
      });

      Map<String, String> blogData = {
        "imgUrl": imageUrl,
        "title": title,
        "desc": desc
      };

      crudMethods.addData(blogData).then((value) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pop(context);
      });
    } else{}
  }

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
      body: _isLoading ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),

      ) : Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: selectedImage != null ? Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(child: Image.file(selectedImage, fit: BoxFit.cover,), borderRadius: BorderRadius.circular(10)),)
                  : Container(
                height: 160,
                decoration: BoxDecoration(
                    color: Colors.amber[200], borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width,
                child: Icon(Icons.add_a_photo),
              ),
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
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: RaisedButton( onPressed: (){
                  uploadBlog();
                },
                  child: Text('Upload'),
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.deepPurpleAccent)
                  ),


                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
