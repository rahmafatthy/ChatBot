import 'package:flutter/material.dart';

import '../utils/colors.dart';

class NotificationItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String time;

  const NotificationItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
        border: Border.all(color: gray),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Text(
                subtitle,
                style: TextStyle(color: gray, fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          Text(
            time,
            style: TextStyle(color: gray, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
