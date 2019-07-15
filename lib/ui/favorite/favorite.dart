import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteState();
}

class FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
    );
  }
}
