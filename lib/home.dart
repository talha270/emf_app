import 'package:emfapp/model/magnitudeprovider.dart';
import 'package:emfapp/pages/visual.dart';
import 'package:emfapp/utils/color.dart';
import 'package:emfapp/widgets/mainheading.dart';
import 'package:emfapp/widgets/meterreading.dart';
import 'package:emfapp/widgets/xyzvalues.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    final magnitudeprovider=Provider.of<Magnitudeprovider>(context,listen: false);
    Timer.periodic(const Duration(seconds: 1),(timer){
      if( magnitudeprovider.continuechange==true){
        magnitudeprovider.changevalue();
      }
    }, );
  }
  @override
  Widget build(BuildContext context) {
    // print("build");
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      // appBar: AppBar(
      //   backgroundColor: AppColors.primarycolor,
      //   elevation: 20,
      //   title: Text("EMF Detection",style: TextStyle(color: AppColors.deeppurple),),
      //   centerTitle: true,
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Mainheading(),
              const Xyzvalues(),
              const Meterreading(),
              SizedBox(
                height: 50,
                width: 200,
                child: Consumer<Magnitudeprovider>(
                  builder: (context, value, child) {
                    return ElevatedButton(onPressed: (){
                      value.continuechange=false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Visual(),));
                    },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            side: const BorderSide(color: Colors.white),
                            backgroundColor: AppColors.primarycolor
                        ),
                        child: const Text("Visualize"));
                  },
                )
              ),
              const SizedBox(height: 10,),
              Consumer<Magnitudeprovider>(builder: (context, value, child) {
                return SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(onPressed: (){
                    value.continuechange=true;
                    value.changevalue();
                  },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          side: const BorderSide(color: Colors.white),
                          backgroundColor: AppColors.primarycolor
                      ),
                      child: const Text("Start")),
                );
              },
              )

            ],
          ),
        ),
      ),
    );
  }
}
