import 'package:chatbot/componant/custom_rich_text.dart';
import 'package:chatbot/componant/imgComponant.dart';
import 'package:chatbot/utils/colors.dart';
import 'package:chatbot/utils/images.dart';
import 'package:chatbot/utils/text.dart';
import 'package:flutter/material.dart';

import '../payment/inAppPurchase.dart';
import '../settings/SettingView.dart';
import 'home_content.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    SettingsView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              homeBottomBar,
              width: 20,
              height: 20,
              color: _currentIndex == 0 ? secondaryPrimaryColor : Colors.grey,
            ),
            label: home,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              settingBottomBar,
              width: 20,
              height: 20,
              color: _currentIndex == 1 ? secondaryPrimaryColor : Colors.grey,
            ),
            label: setting,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const CustomRichText(
          text1: SmartLearning,
          text2: Chat,
          color1: secondaryPrimaryColor,
          color2: black,
          fontWeight1: FontWeight.bold,
          fontSize1: 18,
          fontSize2: 18,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: imgComponant(
              width: 28,
              height: 20,
              img: crown,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const Inapppurchase()),
                );
              },
            ),
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
