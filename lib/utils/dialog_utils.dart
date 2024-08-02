import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context, String text) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                )
              ],
            ),
          );
        });
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
