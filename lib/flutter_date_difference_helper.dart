class FlutterDateDifferenceHelper {
  ///Custom texts
  static String?

      ///Text for Now
      _now,

      ///Text for Year
      _year,

      ///Text for Years
      _yearPlural,

      ///Text for Month
      _month,

      ///Text for Months
      _monthPlural,

      ///Text for Day
      _day,

      ///Text for Days
      _dayPlural,

      ///Text for Hour
      _hour,

      ///Text for Hours
      _hourPlural,

      ///Text for Minute
      _minute,

      ///Text for Minutes
      _minutePlural;

  ///Default language code
  static String _language = "en";

  ///Supported language list
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
    },
    'pt': {
      'Now': 'Agora',
      'Year': 'Ano',
      'Years': 'Anos',
      'Month': 'Mês',
      'Months': 'Meses',
      'Day': 'Dia',
      'Days': 'Dias',
      'Hour': 'Hora',
      'Hours': 'Horas',
      'Minute': 'Minuto',
      'Minutes': 'Minutos'
    },
    'es': {
      'Now': 'Ahora',
      'Year': 'Año',
      'Years': 'Años',
      'Month': 'Mes',
      'Months': 'Meses',
      'Day': 'Día',
      'Days': 'Días',
      'Hour': 'Hora',
      'Hours': 'Horas',
      'Minute': 'Minuto',
      'Minutes': 'Minutos'
    },
    'hi': {
      'Now': 'अब',
      'Year': 'साल',
      'Years': 'साल',
      'Month': 'महीना',
      'Months': 'महीने',
      'Day': 'दिन',
      'Days': 'दिन',
      'Hour': 'घंटा',
      'Hours': 'घंटे',
      'Minute': 'मिनट',
      'Minutes': 'मिनट'
    },
    'ru': {
      'Now': 'Сейчас',
      'Year': 'Год',
      'Years': 'Годы',
      'Month': 'Месяц',
      'Months': 'Месяцы',
      'Day': 'День',
      'Days': 'Дни',
      'Hour': 'Час',
      'Hours': 'Часы',
      'Minute': 'Минута',
      'Minutes': 'Минуты'
    },
    'ja': {
      'Now': '今',
      'Year': '年',
      'Years': '年',
      'Month': '月',
      'Months': '月',
      'Day': '日',
      'Days': '日',
      'Hour': '時',
      'Hours': '時',
      'Minute': '分',
      'Minutes': '分'
    }
  };

  ///Arabic numbers
  static const List<String> _arabicNumbers = [
    ///0
    '٠',

    ///1
    '١',

    ///2
    '٢',

    ///3
    '٣',

    ///4
    '٤',

    ///5
    '٥',

    ///6
    '٦',

    ///7
    '٧',

    ///8
    '٨',

    ///9
    '٩'
  ];

  ///[String] method [toArabicNumber]
  ///takes the number
  ///and return [String] value arabicNumber
  static String toArabicNumber(int number) {
    StringBuffer sBuffer = StringBuffer();
    number.toString().runes.forEach((rune) {
      sBuffer.write(_arabicNumbers[int.parse(String.fromCharCode(rune))]);
    });
    return sBuffer.toString();
  }

  ///[int] method [getDayCountInMonth]
  ///takes year and month
  ///and return [int] value dayCountInMonth
  static int getDayCountInMonth(int year, int month) {
    return [31, year % 4 == 0 ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1];
  }

  ///Set language
  static void setLanguage(String language) {
    language = language.split("_")[0].toLowerCase().trim();
    if (_local.keys.toList().contains(language)) {
      _language = language;
    }
  }

  ///Set texts
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

  ///[String] method [countsToString]
  ///takes yearCount,monthCount and dayCount
  ///and return [int] value differenceText
  static String countsToString(int yearCount, int monthCount, int dayCount, int hourCount, int minuteCount) {
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
