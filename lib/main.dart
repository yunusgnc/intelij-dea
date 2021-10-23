import 'dart:async';

import 'package:flutter/material.dart';
import './pages/chat_screen.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "WhatsApp",
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',
      ),
      debugShowCheckedModeBanner: false,
      home: new WhatsAppHome(),
    );
  }
}
