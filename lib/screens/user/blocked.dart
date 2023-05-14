import 'package:carparking/services/firebase_login.dart';
import 'package:flutter/material.dart';

class BlockedScreen extends StatelessWidget {
  const BlockedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.block,
                size: 40,
                color: Colors.red,
              ),
              const Text(
                'Your Account is Blocked ',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  Auth.signOut(context);
                },
                child: const Text(
                  'Back To Login',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    color: Color(0xff4c505b),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
