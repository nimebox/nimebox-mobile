import 'package:flutter/material.dart';
import 'package:nimebox/widgets/news_widget.dart';
import 'package:nimebox/widgets/anime_list_widget.dart';
import 'package:nimebox/utils.dart';
import 'package:package_info/package_info.dart';

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
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.info_outline,
              ),
              onPressed: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                String version = packageInfo.version;

                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.info_outline),
                              title: Text('Wersja: $version'),
                              onTap: () {}),
                          ListTile(
                              leading: Icon(Icons.bug_report),
                              title: Text('Zgłoś błąd'),
                              onTap: () => launchUrl(context,
                                  'https://github.com/nimebox/nimebox-mobile/issues')),
                        ],
                      );
                    });
              })
        ],
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
