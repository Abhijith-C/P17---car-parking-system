import 'package:carparking/screens/auth/login.dart';
import 'package:carparking/screens/auth/register.dart';
import 'package:carparking/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Parking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => MyLogin(),
        'register': (context) => MyRegister(),
        'home': (context) => HomeScreen()
      },
    );
  }
}
