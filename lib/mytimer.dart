class MyTimer {
  int _duration = 0;

  void start(int duration) {
    _duration = duration;
  }

  Stream<int> output() async* {
    while (_duration >= 0) {
      yield _duration;
      var f = Future.delayed(Duration(seconds: 1), () {
        --_duration;
      });
      await f;
    }
  }

  Stream<bool> active() async* {
    while (true) {
      var timerIsActiveNow = 0 < _duration;
      yield timerIsActiveNow;
    }
  }
}
