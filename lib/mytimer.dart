class MyTimer {
  int _duration = 0;

  void start(int duration) {
    _duration = duration;
  }

  Stream<int> output() async* {
    while (_duration >= 0) {
      yield _duration--;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Stream<bool> active() async* {
    var previousCondition = false;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      var timerIsActiveNow = 0 < _duration;
      if (timerIsActiveNow != previousCondition) {
        yield timerIsActiveNow;
        previousCondition = timerIsActiveNow;
      }
    }
  }
}
