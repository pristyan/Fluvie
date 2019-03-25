import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/playing/now_playing.dart';
import 'package:flutter_movie/ui/popular/popular.dart';
import 'package:flutter_movie/ui/favorite/favorite.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();

}

class HomeState extends State<Home> {

  int selected = 0;

  final tabs = [
    NowPlayingWidget(),
    Popular(),
    Favorite()
  ];

  final tabItems = [
    BottomNavigationBarItem(icon: Icon(Icons.featured_play_list), title: Text('Now Playing')),
    BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('Popular')),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Favorite')),
  ];

  void onTabSelected(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs.elementAt(selected),
      bottomNavigationBar: BottomNavigationBar(
        items: tabItems,
        currentIndex: selected,
        fixedColor: Colors.yellow[700],
        onTap: onTabSelected,
      ),
    );
  }

}
