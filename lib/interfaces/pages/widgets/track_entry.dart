import 'package:droptune/models/author.dart';
import 'package:flutter/material.dart';

import 'package:droptune/models/track.dart';

class TrackEntry extends StatelessWidget {
  final Track track;
  final Function trailingAction;

  TrackEntry({@required this.track, @required this.trailingAction});

  String _buildAuthorsLabel(List<Author> authors)
  {
    String authors = "";

    track.authors.forEach((author) {
      authors += author.name + ", ";
    });

    return authors.length >= 2 ? authors.substring(0, authors.length - 2) : "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    String authors = _buildAuthorsLabel(track.authors);

    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: track.coverImage,
            radius: 25,
          ),
          title: Text(track.name),
          subtitle: Text(authors),
          trailing:
              IconButton(icon: Icon(Icons.settings), onPressed: trailingAction),
        ),
        //Padding(padding: EdgeInsets.only(bottom: 7),)
      ],
    );
  }
}
