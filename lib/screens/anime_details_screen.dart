import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nimebox/models/models.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:share/share.dart';

class AnimeDetailsScreen extends StatefulWidget {
  final AnimeListDataModel item;

  AnimeDetailsScreen({Key key, @required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimeDetailsScreenState();
  }
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  void _launchURL(BuildContext context, String url) async {
    try {
      await launch(
        url,
        option: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsAnimation(
            startEnter: 'android:anim/fade_in',
            startExit: 'android:anim/fade_out',
            endEnter: 'android:anim/fade_in',
            endExit: 'android:anim/fade_out',
          ),
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.share,
              ),
              onPressed: () => Share.share(widget.item.url),
            ),
            IconButton(
                icon: Icon(
                  Icons.open_in_browser,
                ),
                onPressed: () => _launchURL(context, widget.item.url)),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
                child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CachedNetworkImage(
                              imageUrl: widget.item.image,
                              height: 200,
                              width: 136,
                              fit: BoxFit.contain),
                          Expanded(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    widget.item.title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))),
                        ],
                      ),
                    ))),
            Container(
                child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(4),
                            child: ListTile(
                              title: Text(
                                'Episode 1',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              trailing: Icon(
                                Icons.play_circle_outline,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ))),
          ],
        ));
  }
}
