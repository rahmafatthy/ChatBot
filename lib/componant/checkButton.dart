import 'package:chatbot/componant/custom_rich_text.dart';
import 'package:chatbot/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  final String text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CheckButton({
    Key? key,
    required this.text1,
    this.text2,
    this.text3,
    this.text4,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
          widget.onChanged(_isTapped);
        });
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: _isTapped ? secondaryPrimaryColor : primaryColor,
              // Toggle color
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.check,
                color: _isTapped ? Colors.white : Colors.transparent, size: 12),
          ),
          const SizedBox(width: 3), // Add some space between icon and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.text1, style: TextStyle(fontSize: 10)),
                  if (widget.text2 != null && widget.text3 != null)
                    CustomRichText(
                      text1: widget.text2!,
                      text2: widget.text3!,
                      color1: secondaryPrimaryColor,
                      color2: black,
                      fontSize1: 10,
                      fontSize2: 10,
                    ),
                ],
              ),
              if (widget.text4 != null)
                Text(widget.text4!,
                    style: const TextStyle(
                        color: secondaryPrimaryColor, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
