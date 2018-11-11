import 'package:flutter/material.dart';
import 'package:nimebox/widgets/news_widget.dart';
import 'package:nimebox/widgets/anime_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  String _title = 'Anime';

  final List<Widget> _children = [
    AnimeListWidget(),
    NewsWidget(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      setState(() {
        _title = 'Anime';
      });
    } else if (index == 1) {
      setState(() {
        _title = 'News';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          fixedColor: Colors.indigo,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.video_library,
              ),
              title: Text('Anime'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.rss_feed,
              ),
              title: Text('News'),
            ),
          ]),
    );
  }
}