import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.text1,
    required this.text2,
    required this.color1,
    required this.color2,
    this.fontSize1 = 12,
    this.fontSize2 = 12,
    this.fontWeight1,
    this.fontWeight2,
    this.onTap,
  }) : super(key: key);

  final String text1;
  final String text2;
  final Color color1;
  final Color color2;
  final double fontSize1;
  final double fontSize2;
  final FontWeight? fontWeight1;
  final FontWeight? fontWeight2;
  final VoidCallback? onTap; // Make onTap parameter optional

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // Pass onTap callback if provided, otherwise, it will be null
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: TextStyle(
                color: color1,
                fontSize: fontSize1,
                fontWeight: fontWeight1,
              ),
            ),
            TextSpan(
              text: text2,
              style: TextStyle(
                color: color2,
                fontSize: fontSize2,
                fontWeight: fontWeight2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
