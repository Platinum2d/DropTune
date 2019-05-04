import 'package:droptune/models/track.dart';

class Artist{

  Artist(this.id, this.name, this.tracks);

  final int id;
  final String name;
  final List<Track> tracks;
}