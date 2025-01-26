import 'package:emfapp/model/magnitudeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Xyzvalues extends StatelessWidget {
  const Xyzvalues({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10,),
        const Text("Update Interval",style: TextStyle(color: Colors.white),),
        Consumer<Magnitudeprovider>(builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: RadioListTile<int>(
                    value: 1, groupValue: value.groupvalue, onChanged: (int? newvalue){
                  // print(newvalue);
                  value.setupdateinterval(newvalue,Duration.microsecondsPerSecond ~/ 1);
                },
                title: const Text("1 FPS",style: TextStyle(color: Colors.white),)),
              ),
              Expanded(
                child: RadioListTile<int>(
                    value: 2, groupValue: value.groupvalue, onChanged: (int? newvalue){
                  // print(newvalue);
                  value.setupdateinterval(newvalue,Duration.microsecondsPerSecond ~/ 30);
                },
                    title: const Text("30 FPS",style: TextStyle(color: Colors.white),)),
              ),
              Expanded(
                child: RadioListTile<int>(
                    value: 3, groupValue: value.groupvalue, onChanged: (int? newvalue){
                  // print(newvalue);
                  value.setupdateinterval(newvalue,Duration.microsecondsPerSecond ~/ 60);
                },
                    title: const Text("60 FPS",style: TextStyle(color: Colors.white),)),
              )
            ],
          );
        },
        ),
        const SizedBox(height: 20,),
        Consumer<Magnitudeprovider>(builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("X: ${value.x.toStringAsFixed(2)}",style: const TextStyle(fontSize: 20,color: Colors.white),),
            Text("Y: ${value.y.toStringAsFixed(2)}",style: const TextStyle(fontSize: 20,color: Colors.white),),
            Text("Z: ${value.z.toStringAsFixed(2)}",style: const TextStyle(fontSize: 20,color: Colors.white),),
          ],
        ),)
      ],
    );
  }
}

