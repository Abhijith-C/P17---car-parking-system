import 'package:carparking/model/slotmodel.dart';
import 'package:carparking/services/db.dart';
import 'package:flutter/material.dart';

class SlotScreen extends StatelessWidget {
  const SlotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        title: const Text('Car Parking Area'),
      ),
      body: SafeArea(
        child: FutureBuilder<SlotModel?>(
            future: DataBase.getSlot(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: 2,
                itemBuilder: (context, index) => Row(
                  children: [
                    Icon(Icons.car_rental,
                        size: 55,
                        color: getColor(
                            index,
                            index == 0
                                ? snap.data?.slotOne
                                : snap.data?.slotTwo)),
                    Text('Slot ${index + 1}')
                  ],
                ),
              );
            }),
      ),
    );
  }

  Color getColor(int index, bool? filled) {
    if (index == 0) {
      if (filled ?? false) {
        return Colors.red;
      } else {
        return Colors.blue;
      }
    } else {
      if (filled ?? false) {
        return Colors.red;
      } else {
        return Colors.blue;
      }
    }
  }
}
