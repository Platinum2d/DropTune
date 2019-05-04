import 'package:droptune/models/Artist.dart';

class Track {
  Track(this.id, this.remoteId, this.name, this.duration, this.path,
      this.authors);

  final int id;
  final int remoteId;
  final String name;
  final int duration;
  final String path;
  final List<Artist> authors;
  /*final User user;*/
}
