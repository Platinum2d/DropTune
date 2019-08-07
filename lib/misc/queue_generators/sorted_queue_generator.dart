import 'package:droptune/misc/queue_generators/queue_generator.dart';
import 'package:droptune/models/track.dart';

class SortedQueueGenerator implements QueueGenerator{
  final Comparator<Track> sortingKey;

  SortedQueueGenerator({this.sortingKey});

  @override
  List<Track> createQueue(List<Track> tracks) {
    tracks.sort(sortingKey);
    return tracks;
  }
}