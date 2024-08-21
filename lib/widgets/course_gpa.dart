import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/buttons.dart';
class CourseGpaCard extends StatelessWidget {
  final Course course;
  final double screenWidth;

  const CourseGpaCard({super.key, required this.course, required this.screenWidth});

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
    return Card(
      color: Colors.grey[200],
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          course.name,
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          'GPA: ${course.gpa.toStringAsFixed(2)} (${getLetterGrade(course.gpa)})',
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}