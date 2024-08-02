import 'package:chatbot/componant/img_text_row_with_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/componant/custom_button.dart';
import 'package:chatbot/utils/colors.dart';
import 'package:chatbot/utils/images.dart';
import 'package:chatbot/utils/text.dart';
import 'package:chatbot/views/home/home_view.dart';

class PaymentSuccessed extends StatelessWidget {
  const PaymentSuccessed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row with images and dashed line
            const ImageTextRowWithDash(
              image1: done,
              text1: pay,
              image2: done,
              text2: confirmed,
              textColor: secondaryPrimaryColor,
              imageSize: 25.0,
              textSize: 13.0,
              dashColor: Colors.grey,
              dashWidth: 2.0,
              dashSpace: 3.0,
              dashHeight: 0.5,
            ),
            Image.asset(paysuccess, width: 210, height: 155),

            // Custom button to navigate back to home
            CustomButton(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeView()),
                  (Route<dynamic> route) => false,
                );
              },
              text: goBack,
            ),
          ],
        ),
      ),
    );
  }
}
