import 'dart:async';

class MyTimer {
  int _duration = 0;
  Timer _timer;
  StreamController<int> _streamController;

  void _onListen() {}

  void _onPause() {
    _cancelTimer();
  }

  void _onResume() {
    _startTimer();
  }

  void _onCancel() {
    _cancelTimer();
  }

  void _startTimer() {
    _streamController = StreamController<int>(
        onListen: _onListen,
        onPause: _onPause,
        onResume: _onResume,
        onCancel: _onCancel);
    _timer = Timer.periodic(Duration(seconds: 1), _work);
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  void start(int duration) {
    _duration = duration;
    _startTimer();
  }

  Future<void> _work(Timer t) async {
    if (_duration >= 0) {
      _streamController.add(_duration);
      --_duration;
      await Future.delayed(Duration(seconds: 1));
    } else {
      _cancelTimer();
      _streamController.close();
    }
  }

  Stream<int> output() => _streamController.stream;

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
