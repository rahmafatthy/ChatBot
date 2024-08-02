import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomRow extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  final VoidCallback? onTap; // Optional onTap parameter

  const CustomRow({
    required this.img,
    required this.title,
    required this.subtitle,
    this.onTap, // Initialize onTap as optional
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Pass the onTap callback
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 8),
        child: Row(
          children: [
            Image.asset(
              img,
              width: 35,
              height: 35,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                Text(
                  subtitle,
                  style: TextStyle(color: gray, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
