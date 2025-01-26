import 'package:emfapp/model/magnitudeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/color.dart';
class Visual extends StatelessWidget {
  Visual({super.key});
  late ChartSeriesController _chartseriescontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: (){
          Navigator.pop(context);
          },
        ),
        title: const Text("Visual",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 20,
        backgroundColor: AppColors.primarycolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Card(
                color: Colors.grey.shade800,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Consumer<Magnitudeprovider>(
                  builder: (context, providermodel, child) => SfCartesianChart(
                    title: const ChartTitle(text: "X,Y,Z with time"),
                    legend: const Legend(isVisible: true,textStyle: TextStyle(color: Colors.white),title: LegendTitle(text: "Legend",textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                    series: <LineSeries<LiveData,int>>[
                      LineSeries<LiveData,int>(
                          legendItemText: "X",
                        onRendererCreated: (ChartSeriesController controller) {
                          _chartseriescontroller=controller;
                        },
                        color: Colors.red,
                          dataSource: providermodel.values,
                        xValueMapper: (LiveData value,_)=>value.time,
                        yValueMapper: (LiveData value,_)=>value.x,
                          ),
                      LineSeries<LiveData,int>(
                        legendItemText: "Y",
                        onRendererCreated: (ChartSeriesController controller) {
                          _chartseriescontroller=controller;
                        },
                        color: Colors.deepPurple,
                        dataSource: providermodel.values,
                        xValueMapper: (LiveData value,_)=>value.time,
                        yValueMapper: (LiveData value,_)=>value.y,
                      ),
                      LineSeries<LiveData,int>(
                        legendItemText: "Z",
                        onRendererCreated: (ChartSeriesController controller) {
                          _chartseriescontroller=controller;
                        },
                        color: Colors.orange,
                        dataSource: providermodel.values,
                        xValueMapper: (LiveData value,_)=>value.time,
                        yValueMapper: (LiveData value,_)=>value.z,
                      ),
                    ],
                    primaryXAxis: const NumericAxis(
                      isVisible: true,
                      majorGridLines: MajorGridLines(width: 0),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      title: AxisTitle(text: "Time(s)",textStyle: TextStyle(color: Colors.white)),
                      labelStyle: TextStyle(color: Colors.white),
                      interval: 5,
                    ),
                    primaryYAxis: const NumericAxis(
                      isVisible: true,
                      labelStyle: TextStyle(color: Colors.white),
                      majorGridLines: MajorGridLines(width: 0),
                      // edgeLabelPlacement: EdgeLabelPlacement.shift,
                      title: AxisTitle(text: 'U Tesla',textStyle: TextStyle(color: Colors.white)),
                      axisLine: AxisLine(width: 0),
                      majorTickLines: MajorTickLines(color: Colors.white),
                      interval: 5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container()
          ],
        ),
      ),
    );
  }
}

