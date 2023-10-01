import 'package:flutter/material.dart';
import 'package:reviews_flutter/screens/home/home.dart';
import 'package:reviews_flutter/screens/login/login.dart';
import 'package:reviews_flutter/widgets/buttomAppBar/buttomAppBar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      title: 'Reviews App',
      home: MyHomeScreens(),
    );
  }
}

        // body: MyLogin(),
        // bottomNavigationBar: MyButtomAppBar(),