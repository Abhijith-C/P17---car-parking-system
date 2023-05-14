import 'package:carparking/services/firebase_login.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        title: const Text('Admin Home'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'slot');
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue[700]!, width: 1)),
                  child: const ListTile(
                    title: Text('Parking Slot'),
                    leading: Icon(Icons.home, color: Colors.blue),
                    trailing:
                        Icon(Icons.arrow_right_rounded, color: Colors.blue),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'AdminProfile');
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue[700]!, width: 1)),
                  child: const ListTile(
                    title: Text('Profile'),
                    leading: Icon(Icons.person, color: Colors.blue),
                    trailing:
                        Icon(Icons.arrow_right_rounded, color: Colors.blue),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'blackList');
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue[700]!, width: 1)),
                  child: const ListTile(
                    title: Text('BlockList'),
                    leading: Icon(Icons.block, color: Colors.blue),
                    trailing:
                        Icon(Icons.arrow_right_rounded, color: Colors.blue),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Auth.signOut(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue[700]!, width: 1)),
                  child: const ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout, color: Colors.blue),
                    trailing:
                        Icon(Icons.arrow_right_rounded, color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
