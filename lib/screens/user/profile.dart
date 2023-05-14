import 'package:carparking/model/user.model.dart';
import 'package:carparking/services/db.dart';
import 'package:carparking/services/firebase_login.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                    Divider(),
                    ListTile(
                      title: Text('Name : ${snap.data?.name}'),
                      leading: Icon(Icons.person, color: Colors.blue),
                      // trailing: Icon(Icons.arrow_right_rounded, color: Colors.blue),
                    ),
                    ListTile(
                      title: Text('Vehicle NO : ${snap.data?.vehicleNo}'),
                      leading: Icon(Icons.car_rental, color: Colors.blue),
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
