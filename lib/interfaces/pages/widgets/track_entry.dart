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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: ListView(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: _buildImageAndTitle(),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Text("+"),
                      title: Text("Add to playlist"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Text("A|"),
                      title: Text("Rename"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Text("+"),
                      title: Text("Synchronize"),
                    ),
                  ],
                ),
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
