import 'package:chatbot/componant/imgComponant.dart';
import 'package:chatbot/views/auth/login_view.dart';
import 'package:chatbot/views/auth/sign_up.dart';
import 'package:flutter/material.dart';

import '../../componant/custom_button.dart';
import '../../componant/custom_rich_text.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 125, 12, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const imgComponant(width: 325, height: 271, img: onboarding),
            const SizedBox(
              height: 5,
            ),
            const CustomRichText(
              text1: welcome_1,
              text2: welcome_2,
              color1: black,
              color2: secondaryPrimaryColor,
              fontSize1: 28,
              fontSize2: 28,
              fontWeight1: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: signIn,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
            ),
            const SizedBox(
              height: 5,
            ),
            CustomRichText(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              text1: dontHaveAccount,
              color1: black,
              fontSize1: 13,
              text2: signUp,
              color2: secondaryPrimaryColor,
              fontSize2: 13,
            )
          ],
        ),
      ),
    );
  }
}
