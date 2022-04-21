import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chart_sample/DeveloperChart.dart';
import 'package:flutter_chart_sample/base/components.dart';
import 'package:flutter_chart_sample/base/cubit.dart';
import 'package:flutter_chart_sample/base/states.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_chart_sample/module/BarChartPage.dart';
import 'package:flutter_chart_sample/module/LineChartPage.dart';

class PieChartPage extends StatelessWidget {

  var year1PieChartController = TextEditingController();
  var year2PieChartController = TextEditingController();
  var year3PieChartController = TextEditingController();
  var year4PieChartController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        AppCubit cubit = AppCubit.get(context);
        return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Insert # developers per year in Pie Chart'),
                    defaultFormField(
                      controller: year1PieChartController,
                      style: const TextStyle(fontSize: 14.0),
                      type: TextInputType.number,
                      /*  validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter Number of developers in 2018';
                          }
                        },*/

                      label: 'enter number of developers in 2018',
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    defaultFormField(
                      controller: year2PieChartController,
                      style: const TextStyle(fontSize: 14.0),
                      type: TextInputType.number,
                      /*  validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter Number of developers in 2018';
                          }
                        },*/

                      label: 'enter number of developers in 2019',
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    defaultFormField(
                      controller: year3PieChartController,
                      style: const TextStyle(fontSize: 14.0),
                      type: TextInputType.number,
                      /*  validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter Number of developers in 2018';
                          }
                        },*/

                      label: 'enter number of developers in 2020',
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    defaultFormField(
                      controller: year4PieChartController,
                      style: const TextStyle(fontSize: 14.0),
                      type: TextInputType.number,
                      /*  validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter Number of developers in 2018';
                          }
                        },*/

                      label: 'enter number of developers in 2021',
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    defaultButton(
                      text: 'Save Pie chart data',
                      function: () {
                        cubit.insertPieChartDataToDatabase(
                            year: "2018",
                            developers: int.parse(year1PieChartController.text),
                            barColor: charts.ColorUtil.fromDartColor(Colors.green));

                        cubit.insertPieChartDataToDatabase(
                          year: "2019",
                          developers: int.parse(year2PieChartController.text),
                          barColor: charts.ColorUtil.fromDartColor(Colors.green),
                        );

                        cubit.insertPieChartDataToDatabase(
                          year: "2020",
                          developers: int.parse(year3PieChartController.text),
                          barColor: charts.ColorUtil.fromDartColor(Colors.green),
                        );

                        cubit.insertPieChartDataToDatabase(
                          year: "2021",
                          developers: int.parse(year4PieChartController.text),
                          barColor: charts.ColorUtil.fromDartColor(Colors.green),
                        );
                      },
                    ),

                    DeveloperChart(
                      index: cubit.currentIndex,
                      data: cubit.pieChartData,
                    ),


            /*        TextButton(
                        onPressed: () {
                          print('bar');

                          cubit.changeChartType('bar');
                          navigateTo(
                            context,
                            BarChartPage(),
                          );
                        },
                        child: const Text('Bar Chart')),

                    TextButton(
                        onPressed: () {
                          print('pie');
                          cubit.changeChartType('pie');
                          navigateTo(
                            context,
                            PieChartPage(),
                          );
                        },
                        child: const Text('Pie Chart')),
                    TextButton(
                        onPressed: () {
                          print('Line Chart');

                          cubit.changeChartType('line');
                          navigateTo(
                            context,
                            LineChartPage(),
                          );
                        },
                        child: const Text('Line Chart')),*/



                  ],
                ),
              ),
            ),

          );
      },
    );
  }
}
