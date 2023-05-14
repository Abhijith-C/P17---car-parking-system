import 'package:carparking/model/user.model.dart';
import 'package:carparking/services/db.dart';
import 'package:carparking/services/firebase_login.dart';
import 'package:flutter/material.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Auth().currentUser;
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<UserModel?>(
          future: DataBase.getUser(user?.email ?? ''),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Admin Login',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CircleAvatar(
                      radius: 50,
                      child: Text(
                        'A',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    ListTile(
                      title: Text('email : ${snap.data?.email}'),
                      leading: const Icon(Icons.person, color: Colors.blue),
                      // trailing: Icon(Icons.arrow_right_rounded, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
