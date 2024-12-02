class DateTimeUtils {
  static String getFormattedDuration(Duration dateTime) {
    if (dateTime.inDays < 7 && dateTime.inDays > 0) {
      return "${dateTime.inDays} days ago";
    } else if (dateTime.inDays < 30) {
      return "${dateTime.inDays ~/ 7}${dateTime.inDays ~/ 7 > 1 ? " weeks ago" : " week ago"}";
    } else if (dateTime.inDays < 365) {
      return "${dateTime.inDays ~/ 30}${dateTime.inDays ~/ 30 > 1 ? " months ago" : " month ago"}";
    } else if (dateTime.inDays < 365) {
      return "${dateTime.inDays ~/ 365}${dateTime.inDays ~/ 7 > 1 ? " years ago" : " year ago"}";
    } else {
      return "";
    }
  }
}
