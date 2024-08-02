import 'package:chatbot/utils/images.dart';
import 'package:flutter/material.dart';

class CustomTwoRows extends StatelessWidget {
  const CustomTwoRows({Key? key, required this.text1, required this.text2})
      : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRowItem(context, text1),
        _buildRowItem(context, text2),
      ],
    );
  }

  Widget _buildRowItem(BuildContext context, String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(star, width: 15, height: 15),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
