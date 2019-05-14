import 'package:droptune/models/track.dart';

class DroptuneUtils {
  static String buildAuthorsLabel(Track track) {
    String authors = "";

    track.authors.forEach((author) {
      authors += author.name + ", ";
    });

    return authors.length >= 2
        ? authors.substring(0, authors.length - 2)
        : "Unknown";
  }
}