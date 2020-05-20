import 'package:itimer/mytimer.dart';

class Logic {
  Logic(this._timer);

  MyTimer _timer;

  Stream<int> getTimerValues(int duration) {
    _timer.start(duration);
    return _timer.output();
  }

  Stream<bool> get timerIsActive => _timer.active();
}

class ActivityLogic extends Logic {
  ActivityLogic(MyTimer timer) : super(timer);
}

class RestLogic extends Logic {
  RestLogic(MyTimer timer) : super(timer);
}
