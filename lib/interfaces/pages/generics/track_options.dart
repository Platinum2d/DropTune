import 'package:droptune/misc/database/database_client.dart';
import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/models/playlist.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class TrackOptions extends StatefulWidget {
  final Track track;
  final Playlist playlist;

  final DroptunePlayer player = GetItReference.getIt.get<DroptunePlayer>();

  TrackOptions({@required this.track, this.playlist});

  @override
  _TrackOptionsState createState() => _TrackOptionsState();
}

class _TrackOptionsState extends State<TrackOptions> {
  bool _isSelectingPlaylist = false;

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
                image: widget.track.coverImage,
                height: 70,
                width: 70,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.track.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.track.author.name)
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

  List<Widget> _buildStandardMenu(context) {
    return <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: _buildImageAndTitle(),
      ),
      Divider(
        color: Colors.grey,
      ),
      _buildTile(
          action: () {
            setState(() {
              _isSelectingPlaylist = true;
            });
          },
          leadingImage: AssetImage('assets/images/plus_icon.png'),
          title: Text("Add to playlist")),
      _buildTile(
          action: () {
            widget.player.enqueue(widget.track);
            Navigator.pop(context);
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
      widget.playlist != null && widget.playlist.name != "All tracks"
          ? _buildTile(
              action: () {
                GetItReference.getIt
                    .get<DatabaseClient>()
                    .deleteTrackFromPlaylist(widget.track, widget.playlist).then((nothing){
                      Navigator.pop(context, {"removedFromPlaylist": true});
                });
              },
              leadingImage: AssetImage('assets/images/remove_icon.png'),
              title: Text("Remove from " + widget.playlist.name))
          : Container(),
    ];
  }

  ListTile _buildPlaylistEntry(Playlist playlist, context) {
    return ListTile(
      onTap: () {
        GetItReference.getIt
            .get<DatabaseClient>()
            .insertTrackInPlaylist(widget.track, playlist)
            .then((nothing) {
          Navigator.pop(context);
        });
      },
      leading: CircleAvatar(
        backgroundImage: playlist.coverImage,
        radius: 25,
      ),
      title: Text(
        playlist.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Future<List<Widget>> _buildPlaylistSelectingMenu(context) async {
    List<Playlist> playlists =
        await GetItReference.getIt.get<DatabaseClient>().fetchPlaylists();
    List<Widget> entries = [];

    for (Playlist playlist in playlists) {
      entries.add(_buildPlaylistEntry(playlist, context));
      entries.add(Divider(
        color: Colors.grey,
      ));
    }

    entries.removeLast();

    return entries;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 335,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100), topRight: Radius.circular(100))),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: _isSelectingPlaylist
              ? FutureBuilder(
                  future: _buildPlaylistSelectingMenu(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<Widget> children = [
                        Padding(
                          child: Text(
                            "Playlist",
                            style: TextStyle(fontSize: 18),
                          ),
                          padding: EdgeInsets.only(bottom: 15),
                        )
                      ];
                      children.addAll(snapshot.data);
                      return ListView(
                        children: children,
                      );
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  },
                )
              : ListView(
                  children: _buildStandardMenu(context),
                ),
        ));
  }
}
