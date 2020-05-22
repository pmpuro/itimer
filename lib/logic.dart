import 'dart:async';

import 'package:itimer/mytimer.dart';

class Logic {
  Logic(this._timer);

  MyTimer _timer;

  StreamController<int> _streamController = StreamController<int>();

  Stream<int> getTimerValues() {
    return _streamController.stream;
  }

  void start(int duration) {
    _timer.start(duration);
    _streamController.addStream(_timer.output());
  }

  Stream<bool> timerIsActive() {
    return _timer.active();
  }
}

class ActivityLogic extends Logic {
  ActivityLogic(MyTimer timer) : super(timer);
}

class RestLogic extends Logic {
  RestLogic(MyTimer timer) : super(timer);
}
