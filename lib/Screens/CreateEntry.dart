import 'dart:io';
import 'dart:core';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:final_project/Screens/HomePage.dart';
import 'package:image_picker/image_picker.dart';


class CreateEntry extends StatefulWidget {
  @override
  _CreateEntryState createState() => _CreateEntryState();
}

class _CreateEntryState extends State<CreateEntry> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();


  final picker = ImagePicker();
  File _selectedImage;

  bool _isLoading = false;
  String _blogId = '';


  Future getImage() async {

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {

        _selectedImage = File(pickedFile.path);

    });
  }

  Future _uploadPost(File selectedImage, String title, String description) async {
    setState(() {
      _isLoading = true;
    });
    DatabaseReference reference = await FirebaseDatabase.instance.reference();
    Reference ref = await FirebaseStorage.instance.ref().child("Blog_images").child(selectedImage.uri.toString() + ".jpg");
    UploadTask uploadTask = ref.putFile(selectedImage);
    String downloadUrl = await (await uploadTask).ref.getDownloadURL();
    _blogId = reference.child("Blogs").push().key;
    Map data = {
      'image': downloadUrl,
      'title': title,
      'desc': description
    };
    reference.child("Blogs").child(_blogId).set(data).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
              child: _selectedImage != null ? Container(
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(child: Image.file(_selectedImage, fit: BoxFit.cover,), borderRadius: BorderRadius.circular(10)),)
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
                    controller: _titleController,
                    decoration: InputDecoration(hintText: "Title"),

                  ),
                  TextField(
                    controller: _descController,
                    decoration: InputDecoration(hintText: "Description"),

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
                  _uploadPost(_selectedImage, _titleController.text, _descController.text);
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
