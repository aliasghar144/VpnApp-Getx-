import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController{
  var connectTime = 0.obs;
  var second = 0.obs;
  var hours = 0.obs;
  var minute = 0.obs;
  var some = ''.obs;

  @override
  void onInit() {
    startTimer(true);
  }

  showTimer(){
    return hours.value.toString().padLeft(2,'0')+":"+minute.toString().padLeft(2,'0')+':'+second.toString().padLeft(2,'0');
  }

  startTimer(bool isActive) {
    Duration duration = const Duration(seconds: 1);
      Timer.periodic(duration, (timer) {
        if(!isActive){
          print('timercancel');
          timer.cancel();
        }
        connectTime +=1;
        int sec = (connectTime % 60).toInt();
        int min = (connectTime~/60);
        int hour = (connectTime~/3600);
        if(minute >= 60){
          int count = connectTime~/3600;
          minute -= 60*count;
        }
        second.value = sec;
        minute.value = min;
        hours.value = hour;
      }
      );
  }

  resetTimer(){

    connectTime.value = 0;
  }

}