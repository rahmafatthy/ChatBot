import 'package:chatbot/componant/checkButton.dart';
import 'package:chatbot/componant/custom_button.dart';
import 'package:chatbot/views/payment/payment_successed.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/componant/custom_text_field.dart';
import 'package:chatbot/componant/img_text_row_with_dashed_line.dart';
import 'package:chatbot/utils/colors.dart';
import 'package:chatbot/utils/images.dart';
import 'package:chatbot/utils/text.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({Key? key}) : super(key: key);

  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  bool _isButtonChecked = false; // Add this variable

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 600;
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController cvvController = TextEditingController();
    final TextEditingController expiryDateController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    String? cardNumberValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your card number';
      }
      if (!RegExp(r'^[0-9]{16}$').hasMatch(value)) {
        return 'Please enter a valid 16-digit card number';
      }
      return null;
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageTextRowWithDash(
              image1: firstStep,
              text1: pay,
              image2: secondStep,
              text2: confirmed,
              textColor: secondaryPrimaryColor,
              imageSize: isLargeScreen ? 35.0 : 25.0,
              textSize: isLargeScreen ? 16.0 : 13.0,
              dashColor: Colors.grey,
              dashWidth: 2.0,
              dashSpace: 3.0,
              dashHeight: 0.5,
            ),
            SizedBox(height: 20),
            Text(
              select,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isLargeScreen ? 20 : 18,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PaymentContainer(creditCard),
                PaymentContainer(masterCard),
                PaymentContainer(visa),
                PaymentContainer(payPal),
              ],
            ),
            SizedBox(height: 16),
            Text(
              cardNum,
              style: TextStyle(
                fontSize: isLargeScreen ? 17 : 15,
              ),
            ),
            SizedBox(height: 5),
            MyCustomTextField(
              hintText: "1234 1234 1234 1234",
              validator: cardNumberValidator,
              controller: cardNumberController,
              icon: Icons.credit_card,
            ),
            SizedBox(height: 10),
            Text(
              hintPassword,
              style: TextStyle(
                fontSize: isLargeScreen ? 17 : 15,
              ),
            ),
            SizedBox(height: 5),
            MyCustomTextField(
              controller: passwordController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Enter Password';
                }
                if (text.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              icon: Icons.lock,
              hintText: hintPassword,
              obscureText: true,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MyCustomTextField(
                    hintText: "MM/YY",
                    controller: expiryDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter expiry date';
                      }
                      // Add your custom validation here
                      return null;
                    },
                    icon: Icons.calendar_today,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: MyCustomTextField(
                    hintText: "CVV",
                    controller: cvvController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter CVV';
                      }
                      // Add your custom validation here
                      return null;
                    },
                    icon: Icons.lock,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            CheckButton(
              // Include CheckButton widget
              text1: save,
              isChecked: _isButtonChecked,
              onChanged: (value) {
                setState(() {
                  _isButtonChecked = value;
                });
              },
            ),
            Spacer(),
            CustomButton(
                text: next,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const PaymentSuccessed()));
                }),
          ],
        ),
      ),
    );
  }

  Widget PaymentContainer(String img) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(15),
      ),
      width: 80,
      height: 55,
      padding: EdgeInsets.all(8),
      child: Center(
        child: Image.asset(
          img,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
