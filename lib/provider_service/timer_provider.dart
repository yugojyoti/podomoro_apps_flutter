import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  Timer? _timer;
  int start = 10;
  int startOriginal = 10;
  int startSec = 0;
  double barValue = 1;
  bool isBreak = false;

  void setStart(int value) {
    startSec = 0;
    isBreak = false;
    startOriginal = value;
    start = value;
    barValue = 1;
    if (_timer == null) {
    } else {
      _timer!.cancel();
    }
    notifyListeners();
  }

  void breakManage(int value) {
    if (_timer == null) {
    } else {
      _timer!.cancel();
    }
    startSec = 0;

    startOriginal = value;
    start = value;
    barValue = 1;
    startTimer();
  }

  void resetTimer() {
    startSec = 0;
    isBreak = false;
    start = 10;
    startOriginal = 10;

    if (_timer == null) {
    } else {
      _timer!.cancel();
    }
    notifyListeners();
  }

  void stopTimer() {
    if (_timer == null) {
    } else {
      _timer!.cancel();
    }
    notifyListeners();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);

    _timer = Timer.periodic(oneSec, (timer) {
      if (start == 0 && startSec == 0) {
        _timer!.cancel();
        isBreak = !isBreak;
        if (isBreak) {
          breakManage(5);
        }
      } else if (startSec == 0) {
        start = start - 1;
        startSec = 59;
      } else {
        startSec--;
      }

      barValue = (start * 60 + startSec) / (startOriginal * 60);

      notifyListeners();
    });
  }
}
