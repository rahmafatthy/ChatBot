import 'package:chatbot/views/settings/settingItems/Language/Language.dart';
import 'package:chatbot/views/settings/settingItems/Notification/notification.dart';
import 'package:chatbot/views/splash_screen_view/SplashScreenView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../componant/custom_button.dart';
import '../../componant/setting_componant_item.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  generalSupport,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              SettingComponantItem(
                img1: AppLanguageImg,
                text1: AppLanguage,
                subText1: appLanguageSupWord,
                onTap1: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Language()),
                  );
                },
                img2: NotificationImg,
                text2: Notifications,
                subText2: NotificationSubWord,
                onTap2: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Notifi()),
                  );
                },
                img3: FeedbackImg,
                text3: FeedBack,
                subText3: FeedbackSubword,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Support,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              const SettingComponantItem(
                img1: privacy_policy,
                text1: Privacy,
                subText1: PrivacySubWord,
                img2: Terms_of_use,
                text2: termsOfUse,
                subText2: termssupword,
                img3: version,
                text3: Version,
                subText3: VersionSubWord,
              ),
              CustomButton(
                text: logOut,
                onTap: () {
                  _signOut(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // After signing out, navigate to the splash screen or any other screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SplashScreenView()),
      );
    } catch (e) {
      print('Error signing out: $e');
      // Handle error if any
    }
  }
}
