import 'package:droptune/models/track.dart';

abstract class QueueGenerator{
  List<Track> createQueue(List<Track> tracks);
}