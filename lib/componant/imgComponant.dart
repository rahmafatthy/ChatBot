import 'package:flutter/material.dart';

class imgComponant extends StatelessWidget {
  const imgComponant({
    Key? key,
    required this.width,
    required this.height,
    required this.img,
    this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final String img;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        child: Image(
          image: AssetImage(img),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
