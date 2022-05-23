import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AsyncPage extends StatelessWidget {
   AsyncPage({Key? key}) : super(key: key);
  TooltipBehavior tool= TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Async page"),
      ),
      body: Center(
          child: Container(
        child: SafeArea(
            child: SfCartesianChart(
              title: ChartTitle(text: "prova"),
          legend: Legend(isVisible:  true),
          tooltipBehavior: tool,
          series: <ChartSeries>[

            LineSeries<Test,int>(name: "prova",dataSource: [
              Test(1, 3),
              Test(2, 33),
              Test(3, 233),
              Test(4, 53),
              Test(5, 34),
              Test(6, 63),
              Test(7, 3),
              Test(8, 3),
              Test(9, 32),
              Test(10, 3),
            ], xValueMapper: (Test test, _)=> test.x, yValueMapper: (Test test, _)=> test.y,dataLabelSettings: DataLabelSettings(isVisible: true))
          ]  ,
        )),
      )),
    );
  }
}

class Test {
  final int x;
  final int y;

  Test(this.x, this.y);
}
