import 'package:flutter/material.dart';

class CustomMainText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  const CustomMainText({
    Key? key,
    required this.text,
    this.size = 17,
    this.fontWeight = FontWeight.normal,
    // required this.widget,
  }) : super(key: key);

  // final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
