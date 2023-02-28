import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtName = TextEditingController(text: "done");
  TextEditingController tetAddress = TextEditingController();

  String uri = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Color(0xFF008069),
          title: Text("open camera pick image"),
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
                    backgroundImage: FileImage(
                      File(uri),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 115,
                    child: IconButton(
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.camera);
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
                      SnackBar(
                        content: Text("${txtName.text}"),
                      ),
                    );
                  },
                  child: Text("click"))
            ],
          ),
        ),
      ),
    );
  }
}
