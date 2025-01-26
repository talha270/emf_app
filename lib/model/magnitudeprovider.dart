import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:vector_math/vector_math_64.dart';

import 'package:dchs_motion_sensors/dchs_motion_sensors.dart';

class Magnitudeprovider with ChangeNotifier{
  bool continuechange=false;
  double x=0;
  double y=0;
  double z=0;
  double magnitude=0;
  int time=0;
  List<LiveData> values=[];

  Vector3 magnetometer=Vector3.zero();
  Vector3 _accelerometer =Vector3.zero();
  Vector3 _absoluteOrientation2=Vector3.zero();
  int? groupvalue=2;

  changevalue() {
  motionSensors.magnetometer.listen((MagnetometerEvent event){
    magnetometer.setValues(event.x, event.y, event.z);
    var matrix = motionSensors.getRotationMatrix(_accelerometer, magnetometer);
    _absoluteOrientation2.setFrom(motionSensors.getOrientation(matrix));
    x=magnetometer.x;
    y=magnetometer.y;
    z=magnetometer.z;
    magnitude=sqrt((pow(magnetometer.x, 2))+(pow(magnetometer.y, 2))+(pow(magnetometer.z, 2)));
    values.add(LiveData(x, y, z, time++));
    if(values.length>40){
      values.removeAt(0);
    }

  });
  notifyListeners();
  }

  setupdateinterval(int? value,int interval){
    motionSensors.magnetometerUpdateInterval=interval;
    groupvalue=value;
    notifyListeners();
  }
}
class LiveData{
  final double x;
  final double y;
  final double z;
  final int time;

  LiveData(this.x, this.y, this.z, this.time);
}
