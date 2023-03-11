import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        title: Text('Car Parking Area'),
      ),
      body: SafeArea(
          child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => Icon(
          Icons.car_rental,
          size: 55,
          color: index % 2 == 0 ? Colors.red : Colors.green,
        ),
      )),
    );
  }
}
