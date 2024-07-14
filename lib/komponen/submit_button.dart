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
          color: const Color.fromARGB(255, 18, 117, 22),
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

