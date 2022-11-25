class FlutterDateDifferenceHelper {
  static String? _now,
      _year,
      _yearPlural,
      _month,
      _monthPlural,
      _day,
      _dayPlural,
      _hour,
      _hourPlural,
      _minute,
      _minutePlural;

  static String _language = "en";

  static const Map<String, Map<String, String>> _local = {
    'en': {
      'Now': 'Now',
      'Year': 'Year',
      'Years': 'Years',
      'Month': 'Month',
      'Months': 'Months',
      'Day': 'Day',
      'Days': 'Days',
      'Hour': 'Hour',
      'Hours': 'Hours',
      'Minute': 'Minute',
      'Minutes': 'Minutes'
    },
    'tr': {
      'Now': 'Şimdi',
      'Year': 'Yıl',
      'Years': 'Yıl',
      'Month': 'Ay',
      'Months': 'Ay',
      'Day': 'Gün',
      'Days': 'Gün',
      'Hour': 'Saat',
      'Hours': 'Saat',
      'Minute': 'Dakika',
      'Minutes': 'Dakika'
    },
    'de': {
      'Now': 'Jetzt',
      'Year': 'Jahr',
      'Years': 'Jahre',
      'Month': 'Monat',
      'Months': 'Monate',
      'Day': 'Tag',
      'Days': 'Tage',
      'Hour': 'Stunde',
      'Hours': 'Stunden',
      'Minute': 'Minute',
      'Minutes': 'Minuten'
    },
    'fr': {
      'Now': 'À présent',
      'Year': 'An',
      'Years': 'Ans',
      'Month': 'Mois',
      'Months': 'Mois',
      'Day': 'Jour',
      'Days': 'Jours',
      'Hour': 'Heure',
      'Hours': 'Heures',
      'Minute': 'Minute',
      'Minutes': 'Minutes'
    },
    'it': {
      'Now': 'Adesso',
      'Year': 'Anno',
      'Years': 'Anni',
      'Month': 'Mese',
      'Months': 'Mesi',
      'Day': 'Giorno',
      'Days': 'Giorni',
      'Hour': 'Ora',
      'Hours': 'Ore',
      'Minute': 'Minuto',
      'Minutes': 'Minuti'
    },
    'ar': {
      'Now': 'حاليا',
      'Year': 'سنة واحدة',
      'Years': 'سنوات',
      'Month': 'شهر',
      'Months': 'أشهر',
      'Day': 'يوم',
      'Days': 'أيام',
      'Hour': 'ساعة',
      'Hours': 'ساعات',
      'Minute': 'دقيقة',
      'Minutes': 'دقائق'
    }
  };

  static const List<String> _arabicNumbers = [
    '٠',
    '١',
    '٢',
    '٣',
    '٤',
    '٥',
    '٦',
    '٧',
    '٨',
    '٩'
  ];

  static String toArabicNumber(int number) {
    StringBuffer sBuffer = StringBuffer();
    number.toString().runes.forEach((rune) {
      sBuffer.write(_arabicNumbers[int.parse(String.fromCharCode(rune))]);
    });
    return sBuffer.toString();
  }

  static int getDayCountInMonth(int year, int month) {
    return [
      31,
      year % 4 == 0 ? 29 : 28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ][month - 1];
  }

  static void setLanguage(String language) {
    language = language.split("_")[0].toLowerCase().trim();
    if (_local.keys.toList().contains(language)) {
      _language = language;
    }
  }

  static void setTexts(
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
    if (now != null) {
      _now = now;
    }
    if (year != null) {
      _year = year;
    }
    if (yearPlural != null) {
      _yearPlural = yearPlural;
    }
    if (month != null) {
      _month = month;
    }
    if (monthPlural != null) {
      _monthPlural = monthPlural;
    }
    if (day != null) {
      _day = day;
    }
    if (dayPlural != null) {
      _dayPlural = dayPlural;
    }
    if (hour != null) {
      _hour = hour;
    }
    if (hourPlural != null) {
      _hourPlural = hourPlural;
    }
    if (minute != null) {
      _minute = minute;
    }
    if (minutePlural != null) {
      _minutePlural = minutePlural;
    }
  }

  static String countsToString(int yearCount, int monthCount, int dayCount,
      int hourCount, int minuteCount) {
    if (yearCount == 0 && monthCount == 0 && dayCount == 0) {
      if (hourCount == 0 && minuteCount == 0) {
        return _now ?? _local[_language]!["Now"]!;
      } else if (_language == "ar") {
        return "${(hourCount == 0 ? "" : "${toArabicNumber(hourCount)} ${hourCount == 1 ? (_hour ?? _local[_language]!["Hour"]!) : (_hourPlural ?? _local[_language]!["Hours"]!)}")} ${(minuteCount == 0 ? "" : "${toArabicNumber(minuteCount)} ${minuteCount == 1 ? (_minute ?? _local[_language]!["Minute"]!) : (_minutePlural ?? _local[_language]!["Minutes"]!)}")}"
            .replaceAll("  ", " ")
            .trim();
      }
      return "${(hourCount == 0 ? "" : "$hourCount ${hourCount == 1 ? (_hour ?? _local[_language]!["Hour"]!) : (_hourPlural ?? _local[_language]!["Hours"]!)}")} ${(minuteCount == 0 ? "" : "$minuteCount ${minuteCount == 1 ? (_minute ?? _local[_language]!["Minute"]!) : (_minutePlural ?? _local[_language]!["Minutes"]!)}")}"
          .replaceAll("  ", " ")
          .trim();
    }
    if (_language == "ar") {
      return "${(yearCount == 0 ? "" : "${toArabicNumber(yearCount)} ${yearCount == 1 ? (_year ?? _local[_language]!["Year"]!) : (_yearPlural ?? _local[_language]!["Years"]!)}")} ${(monthCount == 0 ? "" : "${toArabicNumber(monthCount)} ${monthCount == 1 ? (_month ?? _local[_language]!["Month"]!) : (_monthPlural ?? _local[_language]!["Months"]!)}")} ${(dayCount == 0 ? "" : "${toArabicNumber(dayCount)} ${dayCount == 1 ? (_day ?? _local[_language]!["Day"]!) : (_dayPlural ?? _local[_language]!["Days"]!)}")}"
          .replaceAll("  ", " ")
          .trim();
    }
    return "${(yearCount == 0 ? "" : "$yearCount ${yearCount == 1 ? (_year ?? _local[_language]!["Year"]!) : (_yearPlural ?? _local[_language]!["Years"]!)}")} ${(monthCount == 0 ? "" : "$monthCount ${monthCount == 1 ? (_month ?? _local[_language]!["Month"]!) : (_monthPlural ?? _local[_language]!["Months"]!)}")} ${(dayCount == 0 ? "" : "$dayCount ${dayCount == 1 ? (_day ?? _local[_language]!["Day"]!) : (_dayPlural ?? _local[_language]!["Days"]!)}")}"
        .replaceAll("  ", " ")
        .trim();
  }
}