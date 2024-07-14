import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final String actionText;
  final controller;

  const TextFields({
    super.key,
    required this.actionText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 24),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 107, 35, 30)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: actionText,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
