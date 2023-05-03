import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 20,
              ),
              Text(
                'Profile Page',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 50,
                child: Text(
                  'A',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              ListTile(
                title: Text('Name : Arun KK'),
                leading: Icon(Icons.person, color: Colors.blue),
                // trailing: Icon(Icons.arrow_right_rounded, color: Colors.blue),
              ),
              ListTile(
                title: Text('Vehicle NO : KL 07 3388'),
                leading: Icon(Icons.car_rental, color: Colors.blue),
                // trailing: Icon(Icons.arrow_right_rounded, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
