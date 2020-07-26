import 'package:chat_app/View/signin.dart';
import 'package:chat_app/View/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,

      theme: ThemeData(
        //primaryColor: Color(0xff145C9E),  //particulRY USED TO CHANGE THE COLOR OF THE TOOLBAR OF THE APP
        scaffoldBackgroundColor: Color(0xff1F1F1F),  //color of the background
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUp(),
    );
  }
}


