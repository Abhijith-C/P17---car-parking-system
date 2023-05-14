import 'package:flutter/material.dart';

class Loading {
  static showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  width: 15,
                ),
                Text("Loading"),
              ],
            ),
          ),
        );
      },
    );
  }

  static void closeLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
