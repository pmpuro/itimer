import 'package:itimer/mytimer.dart';

class Logic {
  Logic(this._timer);

  MyTimer _timer;

  Stream<int> get timerValue => _timer.output();

  Stream<bool> get timerIsActive => _timer.active();

  void start(int duration) {
    _timer.start(duration);
  }
}
