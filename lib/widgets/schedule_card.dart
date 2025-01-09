import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final Color color;
  final String title;
  final Color textColor;
  final Color decorationColor;
  final double fontSize;
  const ScheduleCard({
    super.key,
    required this.color,
    required this.title,
    required this.textColor,
    required this.decorationColor,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 160,
      height: 40,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
              decoration: TextDecoration.underline,
              decorationColor: decorationColor,
              decorationThickness: 2),
        ),
      ),
    );
  }
}
