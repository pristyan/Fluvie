import 'package:flutter/material.dart';
import 'package:flutter_movie/navigation/routes.dart';
import 'package:flutter_movie/ui/home/home.dart';
import 'package:flutter_movie/ui/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLUVIE",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),

      routes: getRoutes(),
      home: Home(),
    );
  }
}
