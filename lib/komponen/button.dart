import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
  final String actionName;

  const DefaultButton({
    super.key,
    required this.actionName,
  });

  int hexColor(String color) {
    //adding prefix
    // ignore: prefer_interpolation_to_compose_strings
    String newColor = '0xff' + color;
    //removing # sign
    newColor = newColor.replaceAll('#', '');
    // convert into integer
    int finalColor = int.parse(newColor);
    return finalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 107, 35, 30),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Center(
          child: Text(
            actionName,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
