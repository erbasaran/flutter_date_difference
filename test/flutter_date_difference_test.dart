import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_date_difference/flutter_date_difference.dart';

void main() {
  test('two date difference', () {
    var dateDiff = FlutterDateDifference(language: "en");

    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 0, 0, 0), DateTime(2022, 1, 1, 0, 0, 1)),
        "Now");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 1, 1, 12, 16)),
        "1 Minute");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 1, 1, 12, 18)),
        "3 Minutes");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 1, 1, 13, 15)),
        "1 Hour");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 1, 1, 14, 15)),
        "2 Hours");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 1, 1, 14, 16)),
        "2 Hours 1 Minute");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 1, 1, 14, 17)),
        "2 Hours 2 Minutes");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 1, 2, 14, 17)),
        "1 Day");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 1, 3, 14, 15)),
        "2 Days");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 2, 1, 14, 15)),
        "1 Month");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 3, 1, 14, 15)),
        "2 Months");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 3, 2, 14, 15)),
        "2 Months 1 Day");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 3, 3, 14, 15)),
        "2 Months 2 Days");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2022, 8, 1, 14, 15)),
        "7 Months");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2023, 1, 1, 14, 15)),
        "1 Year");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2023, 2, 1, 14, 15)),
        "1 Year 1 Month");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2023, 2, 2, 14, 15)),
        "1 Year 1 Month 1 Day");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2023, 2, 3, 14, 15)),
        "1 Year 1 Month 2 Days");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2023, 3, 3, 14, 15)),
        "1 Year 2 Months 2 Days");
    expect(
        dateDiff.calculate(
            DateTime(2022, 1, 1, 12, 15), DateTime(2025, 3, 3, 14, 15)),
        "3 Years 2 Months 2 Days");
  });
}
