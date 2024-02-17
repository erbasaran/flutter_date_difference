# flutter_date_difference

Published Package on pub.dev

#### Usage

```dart
    import 'package:flutter_date_difference/flutter_date_difference.dart';
    
    var _dateDifference = FlutterDateDifference();
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2023, 1, 2))); // 1 Day
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2023, 1, 3))); // 2 Days
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2023, 2, 1))); // 1 Month
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2023, 6, 1))); // 5 Months
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2023, 6, 2))); // 5 Months 1 Day
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2023, 6, 13))); // 5 Months 12 Days
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2024, 1, 1))); // 1 Year
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2024, 1, 2))); // 1 Year 1 Day
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2024, 1, 3))); // 1 Year 2 Days
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2025, 4, 1))); // 2 Years 3 Months
    print(_dateDifference.calculate(DateTime(2023, 1, 1), DateTime(2026, 5, 28))); // 3 Years 4 Months 27 Days
```
##### Change Local
```dart
    _dateDifference.setLanguage(language: "de");
```
##### Change Words
```dart
    _dateDifference.setTexts(year: "Year", yearPlural: "Years", month: "Month", monthPlural: "Months", day: "Day", dayPlural: "Days");
```
##### Ready Languages
    en (english) // Default
    tr (turkish)
    de (german)
    fr (french)
    it (italian)
    ar (arabic)
    pt (portuguese)
    es (spanish)
    ja (japanese)
    ru (russian)
    hi (hindi)