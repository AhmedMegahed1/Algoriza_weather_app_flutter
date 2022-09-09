import 'package:flutter/material.dart';

class TexttButton extends StatelessWidget {
  const TexttButton({
    Key? key,
    required this.onPressed,
    required this.text, required this.height,
  }) : super(key: key);
  final void Function() onPressed;
  final String text;
  final double height; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
          color: Colors.white.withOpacity(
            0.2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
