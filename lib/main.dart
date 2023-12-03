import 'package:d_day_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D-DAY_APP',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}
