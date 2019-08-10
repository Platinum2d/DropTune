import 'package:droptune/interfaces/pages/generics/entries/track_entry.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class AuthorDetailsPage extends StatelessWidget {
  final Author author;

  AuthorDetailsPage(this.author);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(author.name), centerTitle: true,),
      body: Container(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          Track track = author.tracks[index];

          return TrackEntry(track: track, author: author,);

        }, itemCount: author.tracks.length,),
      ),
    );
  }
}
