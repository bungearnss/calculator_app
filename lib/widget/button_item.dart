import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color color;
  final VoidCallback onPressed;

  ButtonItem({
    required this.title,
    required this.titleColor,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: titleColor, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
