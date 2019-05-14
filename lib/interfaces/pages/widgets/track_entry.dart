import 'package:droptune/interfaces/pages/playing_page.dart';
import 'package:droptune/misc/droptune_utils.dart';
import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';

import 'package:droptune/models/track.dart';

class TrackEntry extends StatelessWidget {
  final Track track;

  TrackEntry({@required this.track});

  Widget _buildImageAndTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: track.coverImage,
              height: 70,
              width: 70,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              track.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              DroptuneUtils.buildAuthorsLabel(track),
            )
          ],
        )
      ],
    );
  }

  Future _buildTrackOptions(BuildContext context) {
    return showRoundedModalBottomSheet(
        context: context,
        radius: 20,
        builder: (context) {
          return Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100))),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: _buildImageAndTitle(),),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    onTap: () {
                      print("1");
                    },
                    leading: Image(
                      alignment: Alignment(0, 0),
                      image: AssetImage('assets/images/plus_icon.png'),
                      height: 25,
                      width: 25,
                    ),
                    title: Text("Add to playlist"),
                  ),
                  ListTile(
                    onTap: () {
                      print("2");
                    },
                    leading: Image(
                      color: Color(0xff03b8fa),
                      alignment: Alignment(0, 0),
                      image: AssetImage('assets/images/queue_icon.png'),
                      height: 25,
                      width: 25,
                    ),
                    title: Text("Add to queue"),
                  ),
                  ListTile(
                    onTap: () {
                      print("3");
                    },
                    leading: Image(
                      alignment: Alignment(0, 0),
                      image: AssetImage('assets/images/rename_icon.png'),
                      height: 25,
                      width: 25,
                    ),
                    title: Text("Rename"),
                  ),
                  ListTile(
                    onTap: () {
                      print("4");
                    },
                    leading: Image(
                      alignment: Alignment(0, 0),
                      image: AssetImage('assets/images/sync_icon.png'),
                      height: 25,
                      width: 25,
                    ),
                    title: Text("Synchronize"),
                  ),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    String authors = DroptuneUtils.buildAuthorsLabel(track);

    return GestureDetector(
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PlayingPage(track)));
            },
            leading: CircleAvatar(
              backgroundImage: track.coverImage,
              radius: 25,
            ),
            title: Text(track.name),
            subtitle: Text(authors),
            trailing: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  _buildTrackOptions(context);
                }),
          ),
        ],
      ),
    );
  }
}
