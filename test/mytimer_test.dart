import 'package:flutter_test/flutter_test.dart';
import 'package:itimer/mytimer.dart';

void main() {
  group("MyTimer", () {
    test("first value is the given start value", () async {
      var tested = MyTimer();
      var startValue = 10;
      tested.start(startValue);
      var values = tested.output();
      var first = await values.first;
      expect(first, startValue);
    });

    test("correct number of values are generated", () async {
      var tested = MyTimer();
      var startValue = 3;
      tested.start(startValue);
      var values = tested.output();
      var list = await values.toList();
      expect(list.length, startValue + 1);
      expect(list.last, 0);
    });
  });
}
