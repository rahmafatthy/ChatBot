import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SocialBox extends StatelessWidget {
  const SocialBox({
    required this.text,
    required this.img,
    this.onTap, // Optional onTap parameter
    Key? key,
  }) : super(key: key);

  final String text;
  final String img;
  final VoidCallback? onTap; // Accepts a function with no arguments

  @override
  Widget build(BuildContext context) {
    Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(img), width: 18),
        const SizedBox(width: 5),
        Text(text),
      ],
    );

    // Wrap the container with GestureDetector if onTap is provided
    if (onTap != null) {
      content = GestureDetector(
        onTap: onTap,
        child: content,
      );
    }

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: gray),
      ),
      child: content, // Use the content widget
    );
  }
}
