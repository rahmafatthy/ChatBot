import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'custom_row.dart';

class SettingComponantItem extends StatelessWidget {
  const SettingComponantItem({
    required this.img1,
    required this.text1,
    required this.subText1,
    required this.img2,
    required this.text2,
    required this.subText2,
    required this.img3,
    required this.text3,
    required this.subText3,
    this.onTap1,
    this.onTap2,
    this.onTap3,
    super.key,
  });

  final String img1;
  final String text1;
  final String subText1;
  final String img2;
  final String text2;
  final String subText2;
  final String img3;
  final String text3;
  final String subText3;
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final VoidCallback? onTap3;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
        border: Border.all(color: gray),
      ),
      child: Column(
        children: [
          CustomRow(
            img: img1,
            title: text1,
            subtitle: subText1,
            onTap: onTap1,
          ),
          CustomRow(img: img2, title: text2, subtitle: subText2, onTap: onTap2),
          CustomRow(img: img3, title: text3, subtitle: subText3, onTap: onTap3),
        ],
      ),
    );
  }
}
