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

  Widget _buildEditForm() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width * 0.70,
        child: TextFormField(
          onEditingComplete: () {
            if (!_formKey.currentState.validate()) return;
          },
          initialValue: (null != widget.playlist) ? widget.playlist.name : "",
          onSaved: (String s) {
            _playlistName = s;
          },
          validator: (String s) {},
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

  Widget _buildMenuAndButtons() {
    return widget.playlist != null
        ? ListTile(
            onTap: () {},
            leading: Image(
                height: 25,
                width: 25,
                image: AssetImage('assets/images/remove_icon.png'),
                color: Color(0xff03b8fa)),
            title: Text("Remove"),
          )
        : Padding(
            child: FlatButton(onPressed: () {}, child: Text("CREATE")),
            padding: EdgeInsets.only(top: 10, right: 100, left: 100),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_buildImage(), _buildEditForm()],
              )),
          Divider(
            color: Colors.grey,
          ),
          _buildMenuAndButtons()
        ],
      ),
    );
  }
}
