import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Map<String, double> listMap={
      "Carbohydrates":5,
      "Protein":3,
      "Dairy Products":2,
      "Fruit and vegetables":2,
    };
    return MaterialApp(

      home: Scaffold(

        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:  <Widget>[
              Container(
                width: 200,
                color: Colors.red,
                height: 300,
                child: PieChart(dataMap: listMap,
                  animationDuration: Duration(milliseconds: 800),
                  chartRadius: MediaQuery.of(context).size.width/3.2,
                  colorList: const [Colors.teal,Colors.lightGreenAccent,Colors.pinkAccent,Colors.amber],
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 32,
                  centerText: "Food Group",
                  legendOptions: const LegendOptions(showLegends: false, legendPosition: LegendPosition.bottom,showLegendsInRow: true),
                ),

              ),
              Container(
                width: 200,
                color: Colors.yellow,
              ),
              Container(
                width: 200,
                color: Colors.green,
              ),


            ],

          ),

        ),


      ),

    );

  }
}
