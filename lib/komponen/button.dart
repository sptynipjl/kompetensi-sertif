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
        color: Color(hexColor('#5B9BBE')),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Center(
          child: Text(
            actionName,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color(hexColor('FFFFFF')),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
