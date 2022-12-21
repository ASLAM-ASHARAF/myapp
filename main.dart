import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/splash.dart';

void main() {
  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // darkTheme: ThemeData.dark(),
      home: Splash(),
    );
  }
}
