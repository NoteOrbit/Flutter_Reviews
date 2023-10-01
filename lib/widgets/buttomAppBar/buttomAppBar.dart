import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:reviews_flutter/data/data.dart';

class MyButtomAppBar extends StatefulWidget {
  const MyButtomAppBar({super.key});

  @override
  State<MyButtomAppBar> createState() => _MyButtomAppBarState();
}

class _MyButtomAppBarState extends State<MyButtomAppBar> {
  // instantiate PocketBase
  final pb = PocketBase('http://127.0.0.1:8090');

  // functions random data from data.dart and insert to database
  Future<void> insertRandomData() async {
    for (var i = 0; i < 10; i++) {
      final course = randomCourse();
      print(course);
      final body = <String, dynamic>{
        "course_id": course[0],
        "course_name": course[1],
        "lecturers": course[2],
      };
      await pb.collection('courses').create(body: body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      child: BottomAppBar(
        height: 60,
        child: Row(children: [
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          FloatingActionButton(
            onPressed: () {
              insertRandomData();
            },
            child: const Icon(Icons.add),
            tooltip: 'Add',
            elevation: 2.0,
          ),
        ]),
      ),
    );
  }
}
