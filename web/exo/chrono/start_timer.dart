import 'dart:async';
import 'update_ui_interpol.dart';

startTimerFree(int seconds) {
  Timer.periodic(Duration(seconds: 1), (timer) {
    print(--seconds);
    if (seconds < 0) {
      timer.cancel();
      showDoneMessage();
    }
    
    updateUI(seconds);
  });
}
