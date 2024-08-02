import 'package:chatbot/componant/imgComponant.dart';
import 'package:chatbot/utils/colors.dart';
import 'package:chatbot/utils/images.dart';
import 'package:chatbot/utils/text.dart';
import 'package:chatbot/views/home/home_view.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeView()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 200),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width *
            0.8, // Adjust width based on screen size
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // Ensure the column takes minimum space required
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imgComponant(width: 88, height: 88, img: splashBackground),
            SizedBox(height: 15),
            Text(
              Congratulations,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              signed,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 15),
            imgComponant(width: 36, height: 36, img: loading)
          ],
        ),
      ),
    );
  }
}
