import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp1/homepage.dart';
import 'package:myapp1/login_signup.dart';
import 'package:myapp1/login_form.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login_signup()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://www.bing.com/th?id=OIP.2XzTltnGc8ILEjeLM3Vv0gHaEo&w=316&h=197&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
          fit: BoxFit.fill,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(
                    "https://cdn.shopify.com/s/files/1/2558/9700/files/johnco_400x.png?v=1583903271"),
                width: 200,
                height: 200,
                color: Colors.yellow,
              ),
              Text(
                "MyApp",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              )
            ],
          ),
        ),
      ),
    );
  }
}
