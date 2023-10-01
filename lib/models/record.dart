import 'package:pocketbase/pocketbase.dart';

class Course {
  Course({
    required this.id,
    required this.courseId,
    required this.courseName,
    required this.lecturers,
  });

  final String id;
  final String courseId;
  final String courseName;
  final String lecturers;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'],
        courseId: json["course_id"],
        courseName: json["course_name"],
        lecturers: json["lecturers"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "course_name": courseName,
        "lecturers": lecturers,
      };

  Future<List<Course>> fetchCourses() async {
    final pocketBase = PocketBase('http://localhost:8090');
    final res = await pocketBase.collection('courses').getFullList();
    return List<Course>.from(res.map((x) => Course.fromJson(x.toJson())));
  }

  // Future<void> addCourse(Course course) async {
  //   final pocketBase = PocketBase('http://localhost:8090');
  //   await pocketBase.collection('courses').insert(course.toJson());
  // }

  Future<void> updateCourse(Course course) async {
    final pocketBase = PocketBase('http://localhost:8090');
    await pocketBase
        .collection('courses')
        .update(course.courseId, body: course.toJson());
  }

  Future<void> deleteCourse(String courseId) async {
    final pocketBase = PocketBase('http://localhost:8090');
    await pocketBase.collection('courses').delete(courseId);
  }
}