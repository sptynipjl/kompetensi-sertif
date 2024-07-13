import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubmitButton extends StatelessWidget {
  final String actionName;
  void Function()? onTap;

  SubmitButton({
    super.key,
    required this.actionName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Color(hexColor("#D43300")),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            actionName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

int hexColor(String color) {
  //adding prefix
  String newColor = '0xff$color';
  //removing # sign
  newColor = newColor.replaceAll('#', '');
  // convert into integer
  int finalColor = int.parse(newColor);
  return finalColor;
}
