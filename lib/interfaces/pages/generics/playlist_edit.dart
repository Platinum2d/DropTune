import 'package:droptune/misc/database/database_client.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/models/playlist.dart';
import 'package:flutter/material.dart';

class PlaylistEditPage extends StatefulWidget {
  final Playlist playlist;

  PlaylistEditPage({this.playlist});

  @override
  State<PlaylistEditPage> createState() {
    return _PlaylistEditPageState();
  }
}

class _PlaylistEditPageState extends State<PlaylistEditPage> {
  String _playlistName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEditForm(context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width * 0.70,
        child: TextFormField(
          onEditingComplete: () {
            _formKey.currentState.save();
            widget.playlist.name = _playlistName;
            GetItReference.getIt
                .get<DatabaseClient>()
                .updatePlaylist(widget.playlist);
            Navigator.pop(context);
          },
          initialValue: (null != widget.playlist) ? widget.playlist.name : "",
          onSaved: (String s) {
            _playlistName = s;
          },
          validator: (String s) {
            if (s.isEmpty) return "Please enter a valid name";

            return null;
          },
          decoration: InputDecoration(hintText: "Playlist name"),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: widget.playlist == null
            ? AssetImage("assets/images/default_song_image.jpg")
            : widget.playlist.coverImage,
        height: 70,
        width: 70,
      ),
    );
  }

  Widget _buildMenuAndButtons(context) {
    return widget.playlist != null
        ? ListTile(
            onTap: () {
              GetItReference.getIt
                  .get<DatabaseClient>()
                  .deletePlaylist(widget.playlist.id)
                  .then((t) {
                Navigator.pop(context, {"deleted": true});
              });
            },
            leading: Image(
                height: 25,
                width: 25,
                image: AssetImage('assets/images/remove_icon.png'),
                color: Color(0xff03b8fa)),
            title: Text("Remove"),
          )
        : Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
            child: OutlineButton(
                onPressed: () {
                  if (widget.playlist == null) {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      GetItReference.getIt
                          .get<DatabaseClient>()
                          .insertPlaylist(Playlist(name: _playlistName))
                          .then((playlist) {
                        Navigator.pop(context, playlist);
                      });
                    }
                  }
                },
                child: Text("CREATE")),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      constraints: BoxConstraints.loose(Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.25)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100), topRight: Radius.circular(100))),
      child: ListView(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        children: <Widget>[
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_buildImage(), _buildEditForm(context)],
          )),
          Divider(
            color: Colors.grey,
          ),
          _buildMenuAndButtons(context)
        ],
      ),
    );
  }
}
