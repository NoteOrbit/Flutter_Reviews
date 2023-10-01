import 'package:flutter/material.dart';
import 'package:reviews_flutter/models/record.dart';

class MyCard extends StatefulWidget {
  const MyCard({
    Key? key,
    required this.id,
    required this.course_id,
    required this.course_name,
    required this.lecturers,
    required this.onDelete,
  }) : super(key: key);
  final String id;
  final String course_id;
  final String course_name;
  final String lecturers;
  final VoidCallback onDelete;

  @override
  State<MyCard> createState() => _MyCardState();
}

Future<void> deleteCourse(String courseId) async {
  final del = await Course(
    id: '',
    courseId: '',
    courseName: '',
    lecturers: "",
  ).deleteCourse(courseId);
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: const Icon(Icons.album),
                title: Column(
                  children: [
                    Text(widget.course_id),
                    Text(widget.course_name),
                  ],
                ),
                subtitle: Center(
                  child: Text(
                    widget.lecturers,
                    textAlign: TextAlign.center,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('EDIT'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('REMOVE'),
                  onPressed: () {
                    deleteCourse(widget.id);
                  },
                ),
                const SizedBox(width: 8),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
