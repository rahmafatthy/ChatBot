import 'package:chatbot/utils/colors.dart';
import 'package:chatbot/utils/images.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;

  const Messages({
    Key? key,
    required this.isUser,
    required this.message,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) // Show appropriate image based on whether the message is from the user
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 20),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(robot),
              ),
            ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(vertical: 15).copyWith(
                left: isUser ? 100 : 10,
                right: isUser ? 10 : 100,
              ),
              decoration: BoxDecoration(
                color: isUser ? secondaryPrimaryColor : gray,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: isUser ? Radius.circular(10) : Radius.zero,
                  topRight: Radius.circular(10),
                  bottomRight: isUser ? Radius.zero : Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                      color: isUser ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 10,
                      color: isUser ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isUser) // Show appropriate image based on whether the message is from the user
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 20),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(person),
              ),
            ),
        ],
      ),
    );
  }
}
