import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:flutter/material.dart';
import 'package:nimebox/models/models.dart';
import 'package:nimebox/widgets/anime_widget.dart';
import 'package:share/share.dart';
import 'package:nimebox/utils.dart';

class AnimeDetailsScreen extends StatefulWidget {
  final AnimeListDataModel item;

  AnimeDetailsScreen({Key key, @required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimeDetailsScreenState();
  }
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
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
                onPressed: () => launchUrl(context, widget.item.url)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
                            Image(
                                height: 200,
                                width: 136,
                                fit: BoxFit.contain,
                                image: AdvancedNetworkImage(widget.item.image,
                                    useDiskCache: true)),
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
              AnimeWidget(
                animeTitle: widget.item.title,
              ),
            ],
          ),
        ));
  }
}
