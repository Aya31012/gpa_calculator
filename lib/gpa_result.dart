import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/buttons.dart';
import 'package:gpa_calculator/widgets/course_gpa.dart';
import 'package:gpa_calculator/widgets/total_gpa.dart';

class GpaResultPage extends StatelessWidget {
  final List<Course> courses;
  final double gpa;

  const GpaResultPage({super.key, required this.courses, required this.gpa});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GPA Result'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey, Colors.teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'course-gpa',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'Course GPA:',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: const [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.04),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseGpaCard(course: course, screenWidth: screenWidth);
                },
              ),
            ),
            const Divider(thickness: 2.0, color: Colors.white70),
            Padding(
              padding: EdgeInsets.only(top: screenWidth * 0.04),
              child: Center(
                child: OverallGpaDisplay(gpa: gpa, screenWidth: screenWidth),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



