import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:reviews_flutter/models/get.dart';
import 'package:reviews_flutter/models/record.dart';
import 'package:reviews_flutter/widgets/buttomAppBar/buttomAppBar.dart';
import 'package:reviews_flutter/widgets/cards/cards.dart';

class MyHomeScreens extends StatefulWidget {
  const MyHomeScreens({Key? key}) : super(key: key);

  @override
  State<MyHomeScreens> createState() => _MyHomeScreensState();
}

class _MyHomeScreensState extends State<MyHomeScreens> {
  final courses = <Course>[];
  final pocketBase = PocketBase(
      'http://127.0.0.1:8090'); // Use a more descriptive variable name

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      final courses = await Course(
        id: '',
        courseId: '',
        courseName: '',
        lecturers: "",
      ).fetchCourses();

      setState(() {
        this.courses.addAll(courses);
      });
    } catch (e) {
      // Handle errors here (e.g., network errors, exceptions)
      print('Error fetching courses: $e');
    }
  }

  Future<void> deleteCourse(String courseId) async {
    try {
      await Course(
        id: '',
        courseId: '',
        courseName: '',
        lecturers: "",
      ).deleteCourse(courseId);
    } catch (e) {
      print(courses);
      print('Error deleting course: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page Reviews'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return MyCard(
              id: course.id,
              course_id: course.id,
              course_name: course.courseName,
              lecturers: course.lecturers,
              onDelete: () {
                deleteCourse(course.id);
                setState(() {
                  courses.remove(course);
                });
              },
            );
          },
        ),
      ),
      bottomNavigationBar: MyButtomAppBar(),
    );
  }
}
