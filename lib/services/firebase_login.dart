// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:carparking/common_widget/loader.dart';
import 'package:carparking/common_widget/pop_up.dart';
import 'package:carparking/model/user.model.dart';
import 'package:carparking/screens/user/home_screen.dart';
import 'package:carparking/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  static Future<User?> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    Loading.showLoadingDialog(context);
    try {
      final data = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (data != null) {
        doRoute(
          context,
        );
      }
      Loading.closeLoadingDialog(context);
    } catch (e) {
      Loading.closeLoadingDialog(context);
      showMyDialog(context, e.toString());
      return null;
    }
  }

  static Future<User?> signUp(
      {required String email,
      required String name,
      required String vehicleNo,
      required int phone,
      required String password,
      required BuildContext context}) async {
    Loading.showLoadingDialog(context);

    try {
      final user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        await DataBase.addUser(
            context,
            UserModel(
                email: email,
                name: name,
                phone: phone,
                status: 1,
                type: 2,
                vehicleNo: vehicleNo));

        doRoute(context);
      }

      Loading.closeLoadingDialog(context);
      return user;
    } catch (e) {
      Loading.closeLoadingDialog(context);
      showMyDialog(context, e.toString());
      return null;
    }
  }

  static Future<void> doRoute(
    BuildContext context,
  ) async {
    final user = _auth.currentUser;

    if (user != null) {
      final userData = await DataBase.getUser(user.email!);

      if (userData?.type == 1) {
        //admin

        Navigator.pushNamed(context, 'AdminLogin');
      } else if (userData?.type == 2) {
        // normal user
        if (userData?.status == 2) {
          Navigator.pushNamed(context, 'blockedScreen');
        } else {
          Navigator.pushNamed(context, 'home');
        }
      } else {
        showMyDialog(context, 'Something went wrong');
        signOut(context);
      }
    }
  }

  static Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      'login',
      (route) => false,
    );
  }

  static Future<int> authCheck() async {
    final user = _auth.currentUser;

    if (user != null) {
      final userData = await DataBase.getUser(user.email!);

      if (userData?.type == 1) {
        //admin
        return 1;
      } else if (userData?.type == 2) {
        // normal user
        if (userData?.status == 2) {
          //blocked user
          return 3;
        } else {
          // normal user
          return 2;
        }
      } else {
        //no user
        return 0;
      }
    } else {
      return 0;
    }
  }
}
