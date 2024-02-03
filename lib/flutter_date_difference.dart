library flutter_date_difference;

import 'locale_providers/mobile_locale.dart' if (dart.library.html) 'web_locale.dart' as locale;
import 'flutter_date_difference_helper.dart';

///[FlutterDateDifference] IS a Main Class
class FlutterDateDifference {
  ///[FlutterDateDifference] constructor
  FlutterDateDifference({String? language}) {
    FlutterDateDifferenceHelper.setLanguage(language ?? locale.getLocale());
  }

  ///Set language
  void setLanguage({required String language}) {
    FlutterDateDifferenceHelper.setLanguage(language);
  }

  ///Set texts
  void setTexts(
      {String? now,
      String? year,
      String? yearPlural,
      String? month,
      String? monthPlural,
      String? day,
      String? dayPlural,
      String? hour,
      String? hourPlural,
      String? minute,
      String? minutePlural}) {
    FlutterDateDifferenceHelper.setTexts(
        now: now,
        year: year,
        yearPlural: yearPlural,
        month: month,
        monthPlural: monthPlural,
        day: day,
        dayPlural: dayPlural,
        hour: hour,
        hourPlural: hourPlural,
        minute: minute,
        minutePlural: minutePlural);
  }

  ///[String] method [calculate]
  ///takes date1 and date2
  ///and return [String] value Date Difference
  String calculate(DateTime date1, DateTime date2) {
    var oldDate = date1.isBefore(date2) ? date1 : date2;
    var newDate = date1.isAfter(date2) ? date1 : date2;
    newDate = newDate.add(const Duration(seconds: 1));
    var diff = date2.difference(date1).abs();

    int yearCount = 0, monthCount = 0, dayCount = 0, hourCount = 0, minuteCount = 0;

    if (diff.inDays < 28) {
      dayCount = diff.inDays;
      hourCount = diff.inHours % 24;
      minuteCount = diff.inMinutes % 60;
    } else {
      while (true) {
        if (DateTime(oldDate.year + 1, oldDate.month, oldDate.day).isBefore(newDate)) {
          oldDate = DateTime(oldDate.year + 1, oldDate.month, oldDate.day);
          yearCount++;
        } else if ((oldDate.month == 12
                ? DateTime(oldDate.year + 1, 1, oldDate.day)
                : DateTime(oldDate.year, oldDate.month + 1, oldDate.day))
            .isBefore(newDate)) {
          oldDate =
              oldDate.month == 12 ? DateTime(oldDate.year + 1, 1, oldDate.day) : DateTime(oldDate.year, oldDate.month + 1, oldDate.day);
          monthCount++;
        } else {
          if (FlutterDateDifferenceHelper.getDayCountInMonth(oldDate.year, oldDate.month) < oldDate.day + 1) {
            if ((oldDate.month + monthCount == 12 ? DateTime(oldDate.year + 1, 1, 1) : DateTime(oldDate.year, oldDate.month + 1, 1))
                .isBefore(newDate)) {
              oldDate = oldDate.month + monthCount == 12 ? DateTime(oldDate.year + 1, 1, 1) : DateTime(oldDate.year, oldDate.month + 1, 1);
              dayCount++;
            } else {
              break;
            }
          } else if (DateTime(oldDate.year, oldDate.month, oldDate.day + 1).isBefore(newDate)) {
            oldDate = DateTime(oldDate.year, oldDate.month, oldDate.day + 1);
            dayCount++;
          } else {
            break;
          }
        }
      }
    }

    return FlutterDateDifferenceHelper.countsToString(yearCount, monthCount, dayCount, hourCount, minuteCount);
  }
}
