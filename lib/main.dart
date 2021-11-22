import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/StartPage.dart';
import 'pages/DisplayPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fix Portrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/Display': (context) => DisplayPage(),
      },
    );
  }
}
