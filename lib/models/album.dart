import 'package:droptune/models/track.dart';

class Album{

  Album(this.id, this.name, this.tracks);

  final int id;
  final String name;
  final List<Track> tracks;
}