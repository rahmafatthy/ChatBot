import 'package:chatbot/componant/custom_button.dart';
import 'package:chatbot/utils/colors.dart';
import 'package:chatbot/utils/images.dart';
import 'package:chatbot/utils/text.dart';
import 'package:chatbot/views/payment/payment-option.dart';
import 'package:chatbot/views/payment/payment_successed.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/componant/custom_container.dart';
import 'package:chatbot/componant/Custom_two_rows.dart';

import '../../componant/imgComponant.dart';

class Inapppurchase extends StatefulWidget {
  const Inapppurchase({Key? key});

  @override
  _InapppurchaseState createState() => _InapppurchaseState();
}

class _InapppurchaseState extends State<Inapppurchase> {
  int? selectedContainerIndex;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: imgComponant(
                height: screenSize.width * 0.8,
                width: screenSize.width * 0.9,
                img: robot2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              upgrade,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            CustomTwoRows(text1: purchase1, text2: purchase2),
            CustomTwoRows(text1: purchase3, text2: purchase4),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  text1: Weekly,
                  text2: wPrice,
                  isSelected: selectedContainerIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 0;
                    });
                  },
                ),
                CustomContainer(
                  text1: Monthly,
                  text2: mPrice,
                  isSelected: selectedContainerIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 1;
                    });
                  },
                ),
                CustomContainer(
                  text1: yearly,
                  text2: yPrice,
                  isSelected: selectedContainerIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 2;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            CustomButton(
                text: Con,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const PaymentOption()));
                }),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  termssupword,
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(width: 20),
                Container(
                  width: 1.3,
                  height: 15,
                  color: Colors.grey,
                ),
                SizedBox(width: 20),
                Text(
                  Privacy,
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              endPage,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
