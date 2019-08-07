import 'package:droptune/misc/queue_generators/queue_generator.dart';
import 'package:droptune/models/track.dart';

class ShuffledQueueGenerator implements QueueGenerator{

  @override
  List<Track> createQueue(List<Track> tracks) {
    tracks.shuffle();
    return tracks;
  }
}