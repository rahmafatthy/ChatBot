import 'package:chatbot/utils/colors.dart';
import 'package:flutter/material.dart';

class LanguageListItem extends StatelessWidget {
  final String languageName;
  final String languageImage;
  final int index;
  final bool isChecked;
  final VoidCallback onTap;

  const LanguageListItem({
    required this.languageName,
    required this.languageImage,
    required this.index,
    required this.isChecked,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Image.asset(
            languageImage,
            width: 35,
            height: 35,
          ),
          SizedBox(width: 12),
          Text(
            languageName,
            style: TextStyle(fontSize: 14),
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(1),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: isChecked
                  ? Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryPrimaryColor,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
