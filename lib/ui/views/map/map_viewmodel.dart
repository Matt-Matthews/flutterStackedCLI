import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel {
  double _angle = 0;

  double get rotateAngle => _angle;

  void updateRotateAngle() {
    // for(int i = 0; i <= 200; i++){

    //   _angle += 10;
    // }
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (kDebugMode) {
        print("time test😒😒${timer.tick.toString()} + $_angle");
      }
      _angle += 10;
      notifyListeners();
    });
//     Timer timer = new Timer(new Duration(seconds: 5), () {
//    debugPrint("Print after 5 seconds");
// });
  }
}
