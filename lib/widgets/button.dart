import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  // Constructors
  const Button(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(45)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: textColor),
        ),
      ),
    );
  }
}
