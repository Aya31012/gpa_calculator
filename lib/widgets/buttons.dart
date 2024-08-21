import 'package:flutter/material.dart';

class GpaButtons extends StatelessWidget {
  final double screenWidth;
  final VoidCallback onAddCourse;
  final VoidCallback onCalculateGpa;
  final VoidCallback onResetForm;

  const GpaButtons({super.key,
    required this.screenWidth,
    required this.onAddCourse,
    required this.onCalculateGpa,
    required this.onResetForm,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: onAddCourse,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenWidth * 0.02,
            ),
          ),
          label: Text(
            'Add Course',
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
        ),
        ElevatedButton.icon(
          onPressed: onCalculateGpa,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.orangeAccent,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenWidth * 0.02,
            ),
          ),
          label: Text(
            'Calculate GPA',
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
        ),
        ElevatedButton.icon(
          onPressed: onResetForm,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenWidth * 0.02,
            ),
          ),
          label: Text(
            'Reset',
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
        ),
      ],
    );
  }
}

class Course {
  String name = '';
  double grade = 0.0;
  int creditHours = 0;
  double gpa = 0.0;
}
