import 'package:droptune/models/playlist.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class TrackOptions extends StatelessWidget {
  final Track track;
  final Playlist playlist;

  TrackOptions({@required this.track, this.playlist});

  Widget _buildImageAndTitle() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
              Text(track.author.name)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTile(
      {@required Function action,
      @required AssetImage leadingImage,
      @required Widget title}) {
    const double dimension = 25;

    return ListTile(
      onTap: action,
      leading: Image(
        color: Color(0xff03b8fa),
        alignment: Alignment(0, 0),
        image: leadingImage,
        height: dimension,
        width: dimension,
      ),
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 335,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100), topRight: Radius.circular(100))),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _buildImageAndTitle(),
            ),
            Divider(
              color: Colors.grey,
            ),
            _buildTile(
                action: () {
                  print("1");
                },
                leadingImage: AssetImage('assets/images/plus_icon.png'),
                title: Text("Add to playlist")),
            _buildTile(
                action: () {
                  print("2");
                },
                leadingImage: AssetImage('assets/images/queue_icon.png'),
                title: Text("Add to queue")),
            _buildTile(
                action: () {
                  print("3");
                },
                leadingImage: AssetImage('assets/images/rename_icon.png'),
                title: Text("Rename")),
            _buildTile(
                action: () {
                  print("4");
                },
                leadingImage: AssetImage('assets/images/sync_icon.png'),
                title: Text("Synchronize")),
            playlist != null && playlist.name != "All tracks"
                ? _buildTile(
                    action: () {
                      print("5");
                    },
                    leadingImage: AssetImage('assets/images/remove_icon.png'),
                    title: Text("Remove from " + playlist.name))
                : Container(),
          ],
        ));
  }
}
