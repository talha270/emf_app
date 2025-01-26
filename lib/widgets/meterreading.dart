import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../model/magnitudeprovider.dart';
class Meterreading extends StatelessWidget {
  const Meterreading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Consumer<Magnitudeprovider>(builder: (context, value, child) => SfRadialGauge(
          axes: [
            RadialAxis(
              minimum: 0,
              maximum: 1000,
              labelOffset: 20,
              tickOffset: 20,
              ranges: [
                GaugeRange(
                  label: "Safe",
                    startWidth: 20,
                    endWidth: 20,
                    labelStyle: const GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    color: Colors.green,startValue: 0, endValue: 200),
                GaugeRange(
                    label: "Moderate",
                    startWidth: 20,
                    endWidth: 20,
                    labelStyle: const GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    color: Colors.orange,startValue: 200, endValue: 500),
                GaugeRange(
                    label: "Danger",
                    startWidth: 20,
                    endWidth: 20,
                    labelStyle: const GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    color: Colors.red,startValue: 500, endValue: 1000),
              ],
              pointers: [
                NeedlePointer(value: value.magnitude,needleColor: Colors.white,),
              ],
              annotations: [
                GaugeAnnotation(widget: Container(
                  child: Text(value.magnitude.toStringAsFixed(2),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
                angle: 90,
                positionFactor: 0.6,)
              ],
            )
          ],
        ),)
      ],
    );
  }
}

