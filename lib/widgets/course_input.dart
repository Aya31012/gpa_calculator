import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/buttons.dart';

class CourseInputField extends StatelessWidget {
  final int index;
  final Course course;
  final double screenWidth;
  final ValueChanged<Course> onChanged;

  const CourseInputField({super.key,
    required this.index,
    required this.course,
    required this.screenWidth,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[50],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            TextFormField(
              initialValue: course.name,
              decoration: InputDecoration(
                labelText: 'Course Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                course.name = value;
                onChanged(course);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the course name';
                }
                return null;
              },
            ),
            SizedBox(height: screenWidth * 0.03),
            TextFormField(
              initialValue: course.grade != 0.0 ? course.grade.toString() : '',
              decoration: InputDecoration(
                labelText: 'Grade (out of 100)',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                course.grade = double.tryParse(value) ?? 0.0;
                onChanged(course);
              },
              validator: (value) {
                if (value == null || value.isEmpty || double.tryParse(value)! > 100 || double.tryParse(value)! < 0) {
                  return 'Please enter a valid grade between 0 and 100';
                }
                return null;
              },
            ),
            SizedBox(height: screenWidth * 0.03),
            TextFormField(
              initialValue: course.creditHours != 0 ? course.creditHours.toString() : '',
              decoration: InputDecoration(
                labelText: 'Credit Hours',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                course.creditHours = int.tryParse(value) ?? 0;
                onChanged(course);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter credit hours';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
