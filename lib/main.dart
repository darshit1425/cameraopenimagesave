import 'package:cameraopenimagesave/camera.dart';
import 'package:cameraopenimagesave/gallery.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home1(),
      },
    ),
  );
}
