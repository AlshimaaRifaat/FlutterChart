import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:flutter_chart_sample/DeveloperSeries.dart';


class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;
   String chartType;
   List<charts.Series<DeveloperSeries, num>> bieChartseries;
   List<charts.Series<DeveloperSeries, String>> barChartseries;
   List<charts.Series<DeveloperSeries, int>> lineChartSeries;


  DeveloperChart({@required this.chartType='bar',@required this.data});
  @override
  Widget build(BuildContext context) {

    print("chart ty: "+chartType);
    if(chartType=='bar'){

      barChartseries = [
        charts.Series(
            id: "developers",
            data: data,
            domainFn: (DeveloperSeries barChartseries, _) =>barChartseries.year ,
            measureFn: (DeveloperSeries barChartseries, _) => barChartseries.developers,
            colorFn: (DeveloperSeries barChartseries, _) => barChartseries.barColor
        )
      ];
      return Container(
        height: 300,
        padding: const EdgeInsets.all(25),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: <Widget>[

                Text(
                  "Yearly Growth",
                  style: Theme.of(context).textTheme.bodyText1,
                ),

                Expanded(

                  child: charts.BarChart(barChartseries, animate: true),


                )
              ],
            ),
          ),
        ),
      );
    }else if(chartType=='pie'){
      print(data.toString());

      bieChartseries = [
        charts.Series(
            id: "developers",
            data: data,
            domainFn: (DeveloperSeries series, _) =>series.yearNum,
            measureFn: (DeveloperSeries series, _) => series.developers,
            colorFn: (DeveloperSeries series, _) => series.barColor
        )
      ];
      return Container(
        height: 300,
        padding: const EdgeInsets.all(25),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: <Widget>[

                Text(
                  "Yearly Growth",
                  style: Theme.of(context).textTheme.bodyText1,
                ),

                Expanded(
                  child: charts.PieChart(bieChartseries,
                      defaultRenderer: charts.ArcRendererConfig(
                          arcRendererDecorators: [
                            charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.inside)
                          ]),
                      animate: true),
                )
              ],
            ),
          ),
        ),
      );
    }else if(chartType=='line'){

      print("line data "+data.length.toString());
      print("typeee "+chartType);

      lineChartSeries = [
        charts.Series(
            id: "developers",
            data: data,
            domainFn: (DeveloperSeries lineChartSeries, _) => lineChartSeries.yearNum,
            measureFn: (DeveloperSeries lineChartSeries, _) => lineChartSeries.developers,
            colorFn: (DeveloperSeries lineChartSeries, _) => lineChartSeries.barColor
        )
      ];





      return Container(
        height: 300,
        padding: const EdgeInsets.all(25),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: <Widget>[

                Text(
                  "Yearly Growth",
                  style: Theme.of(context).textTheme.bodyText1,
                ),

                Expanded(
                  child: charts.LineChart(lineChartSeries,
                      domainAxis: const charts.NumericAxisSpec(
                        tickProviderSpec:
                        charts.BasicNumericTickProviderSpec(zeroBound: false),
                        viewport: charts.NumericExtents(2016.0, 2022.0),
                      ),
                      animate: true),
                )
              ],
            ),
          ),
        ),
      );
    }


  }


}