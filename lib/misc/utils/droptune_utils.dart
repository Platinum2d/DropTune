
class DroptuneUtils {
  static const int _titleTrackLimit = 30;

  static String trimTrackTitle({String title}){
    if (title.length > _titleTrackLimit){
      title = title.substring(0, _titleTrackLimit);
      title = title.replaceRange(_titleTrackLimit - 3, _titleTrackLimit, "...");
    }
    return title;
  }
}
