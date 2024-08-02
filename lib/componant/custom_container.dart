import 'package:chatbot/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomContainer({
    required this.text1,
    required this.text2,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? secondaryPrimaryColor : primaryColor,
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        width: MediaQuery.of(context).size.width * 0.25,
        height: 95,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
