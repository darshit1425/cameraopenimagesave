import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  TextEditingController txtName = TextEditingController(text: "done");

  String uri = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Color(0xFF008069),
          title: Text("photo gallry save"),
          leading: Icon(Icons.arrow_back),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(File(uri)),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 115,
                    child: IconButton(
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          uri = xfile!.path;
                        });
                      },
                      icon: Icon(Icons.camera_alt_outlined),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${txtName.text}")));
                  },
                  child: Text("click"))
            ],
          ),
        ),
      ),
    );
  }
}
