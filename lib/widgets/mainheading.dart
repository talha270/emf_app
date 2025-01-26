import 'package:emfapp/model/magnitudeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Mainheading extends StatelessWidget {
  const Mainheading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 30,),
          Consumer<Magnitudeprovider>(builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(value.magnitude.toStringAsFixed(2),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),),
              SizedBox(width: 10,),
              Text("μTesla",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),),
            ],);
          },),
          
        ],
    );
  }
}

