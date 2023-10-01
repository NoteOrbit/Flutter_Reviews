class Get {
  final String course_id;
  final String course_name;
  final String lecturers;

  Get({
    required this.course_id,
    required this.course_name,
    required this.lecturers,
  });

  factory Get.fromJson(Map<String, dynamic> json) {
    return Get(
      course_id: json['course_id'],
      course_name: json['course_name'],
      lecturers: json['lecturers'],
    );
  }
}


