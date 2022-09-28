import 'package:flutter/material.dart';

class CustomElevateButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final double textSize;
  const CustomElevateButtonWidget(
      {Key? key,
      this.width = double.maxFinite,
      this.height = 60,
      this.onPressed,
      this.backgroundColor = const Color(0xFF1ECF6C),
      required this.text,
      this.textColor = Colors.white,
      this.textSize = 22.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: backgroundColor,
              shadowColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0))),
          child: Text(text,
              style: TextStyle(color: textColor, fontSize: textSize))));
}
