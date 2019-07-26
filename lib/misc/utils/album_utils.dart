import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/models/album.dart';

class AlbumUtils {
  static List<Album> getCachedAllAlbums(){
    return GetItReference.getIt.get<List<Album>>();
  }
}
