import 'package:flutter/material.dart';
import 'package:chatbot/componant/dashed_line.dart';

class ImageTextRowWithDash extends StatelessWidget {
  final String image1;
  final String text1;
  final String image2;
  final String text2;
  final Color textColor;
  final double imageSize;
  final double textSize;
  final Color dashColor;
  final double dashWidth;
  final double dashSpace;
  final double dashHeight;

  const ImageTextRowWithDash({
    Key? key,
    required this.image1,
    required this.text1,
    required this.image2,
    required this.text2,
    this.textColor = Colors.black,
    this.imageSize = 25.0,
    this.textSize = 13.0,
    this.dashColor = Colors.grey,
    this.dashWidth = 2.0,
    this.dashSpace = 3.0,
    this.dashHeight = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Image.asset(image1, height: imageSize, width: imageSize),
            Text(text1, style: TextStyle(fontSize: textSize, color: textColor)),
          ],
        ),
        Expanded(
          child: CustomPaint(
            painter: DashLinePainter(
              color: dashColor,
              dashWidth: dashWidth,
              dashSpace: dashSpace,
            ),
            child: SizedBox(
              height: dashHeight,
            ),
          ),
        ),
        Column(
          children: [
            Image.asset(image2, height: imageSize, width: imageSize),
            Text(text2, style: TextStyle(fontSize: textSize, color: textColor)),
          ],
        ),
      ],
    );
  }
}
