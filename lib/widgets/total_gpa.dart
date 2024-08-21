import 'package:flutter/material.dart';
class OverallGpaDisplay extends StatelessWidget {
  final double gpa;
  final double screenWidth;

  const OverallGpaDisplay({super.key, required this.gpa, required this.screenWidth});

  String getLetterGrade(double gpa) {
    if (gpa >= 3.7) {
      return "A";
    } else if (gpa >= 3.3) {
      return "B+";
    } else if (gpa >= 3.0) {
      return "B";
    } else if (gpa >= 2.7) {
      return "C+";
    } else if (gpa >= 2.0) {
      return "C";
    } else if (gpa >= 1.7) {
      return "D+";
    } else if (gpa >= 1.0) {
      return "D";
    } else {
      return "F";
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Overall GPA: ',
        style: TextStyle(
          fontSize: screenWidth * 0.07,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: const [
            Shadow(
              offset: Offset(3.0, 3.0),
              blurRadius: 4.0,
              color: Colors.black38,
            ),
          ],
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' ${gpa.toStringAsFixed(2)} (${getLetterGrade(gpa)})',
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
