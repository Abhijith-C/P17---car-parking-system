// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carparking/screens/admin/admin_home.dart';
import 'package:carparking/screens/auth/login.dart';
import 'package:carparking/screens/user/blocked.dart';
import 'package:carparking/screens/user/home_screen.dart';
import 'package:carparking/services/firebase_login.dart';
import 'package:flutter/material.dart';

class AuthCheck extends StatelessWidget {
  AuthCheck({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Auth.authCheck(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == 0) {
              return const MyLogin();
            }
            if (snapshot.data == 1) {
              return const AdminHome();
            }
            if (snapshot.data == 3) {
              return const BlockedScreen();
            }
            if (snapshot.data == 2) {
              return const HomeScreen();
            } else {
              return const MyLogin();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


// const char* ssid = "AM (2Ghz)";
// const char* password = "$tr0NgPa$$w06D#2";
