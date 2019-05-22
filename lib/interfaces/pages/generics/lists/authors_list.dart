import 'package:droptune/interfaces/pages/generics/entries/author_entry.dart';
import 'package:droptune/models/author.dart';
import 'package:flutter/material.dart';

class AuthorsList extends StatelessWidget {
  final List<Author> authors;

  AuthorsList({@required this.authors});

  @override
  Widget build(BuildContext context) {
    Widget emptyMessage = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.archive,
            size: 50,
            color: Colors.grey,
          ),
          Text("No authors here!")
        ],
      ),
    );

    if (authors.length > 0)
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return AuthorEntry(
            author: authors[index],
          );
        },
        itemCount: authors.length,
      );
    else
      return emptyMessage;
  }
}
