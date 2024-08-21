import 'package:flutter/material.dart';
import 'package:gpa_calculator/gpa_result.dart';
import 'package:gpa_calculator/widgets/buttons.dart';
import 'package:gpa_calculator/widgets/course_input.dart';

class GpaCalculator extends StatefulWidget {
  const GpaCalculator({super.key});

  @override
   createState() => _GpaCalculatorState();
}

class _GpaCalculatorState extends State<GpaCalculator> {
  List<Course> courses = [Course()];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GPA Calculator'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.grey[200],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      for (var i = 0; i < courses.length; i++)
                        CourseInputField(
                          index: i,
                          course: courses[i],
                          screenWidth: screenWidth,
                          onChanged: (value) {
                            setState(() {
                              courses[i] = value;
                            });
                          },
                        ),
                      SizedBox(height: screenWidth * 0.05),
                      GpaButtons(
                        screenWidth: screenWidth,
                        onAddCourse: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              courses.add(Course());
                            });
                          }
                        },
                        onCalculateGpa: calculateGpa,
                        onResetForm: resetForm,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void calculateGpa() {
    double totalPoints = 0;
    int totalHours = 0;

    for (var course in courses) {
      double gradePoint = convertToGpa(course.grade);
      course.gpa = gradePoint;
      totalPoints += gradePoint * course.creditHours;
      totalHours += course.creditHours;
    }


    double gpa = totalPoints / totalHours;


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GpaResultPage(courses: courses, gpa: gpa),
      ),
    );
  }


  void resetForm() {
    setState(() {
      courses = [Course()];
    });
  }

  double convertToGpa(double grade) {
    if (grade >= 90) {
      return 4.0;
    } else if (grade >= 80) {
      return 3.0;
    } else if (grade >= 70) {
      return 2.0;
    } else if (grade >= 60) {
      return 1.0;
    } else {
      return 0.0;
    }
  }
}
