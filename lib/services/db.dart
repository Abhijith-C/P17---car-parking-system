import 'dart:developer';

import 'package:carparking/common_widget/loader.dart';
import 'package:carparking/model/slotmodel.dart';

// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/user.model.dart';

class DataBase {
  static final db = FirebaseFirestore.instance;

  static Future<void> addUser(BuildContext context, UserModel user) async {
    try {
      await db.collection('users').doc(user.email).set(user.toMap());
    } catch (e) {
      log(e.toString());

      showMyDialog(context, e.toString());
    }
  }

  static Future<UserModel?> getUser(String email) async {
    try {
      final User = (await db.collection('users').doc(email).get()).data();
      if (User != null) {
        return UserModel.fromMap(User);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<SlotModel?> getSlot() async {
    try {
      final Slot =
          (await db.collection('slot').doc('xW7Qps7dlbZezeOYFWM7').get())
              .data();
      if (Slot != null) {
        return SlotModel.fromMap(Slot);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<List<UserModel>?> getAllUser(BuildContext context) async {
    try {
      final allUsers = (await db.collection('users').get()).docs;
      return allUsers.map((e) => UserModel.fromMap(e.data())).toList();
    } catch (e) {
      showMyDialog(context, e.toString());
      return null;
    }
  }

  static Future<void> blackListUser(
      BuildContext context, String id, String status) async {
    try {
      await db.collection('users').doc(id).update({'status': status});
    } catch (e) {
      showMyDialog(context, e.toString());
    }
  }

  static Future<List<UserModel>?> getBlackListedUsers(
      BuildContext context) async {
    try {
      final allUsers =
          (await db.collection('users').where('status', isEqualTo: 2).get())
              .docs;
      return allUsers.map((e) => UserModel.fromMap(e.data())).toList();
    } catch (e) {
      showMyDialog(context, e.toString());
      return null;
    }
  }
}
