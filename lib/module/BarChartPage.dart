import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chart_sample/DeveloperChart.dart';
import 'package:flutter_chart_sample/base/components.dart';
import 'package:flutter_chart_sample/base/cubit.dart';
import 'package:flutter_chart_sample/base/states.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_chart_sample/module/LineChartPage.dart';
import 'package:flutter_chart_sample/module/PieChartpage.dart';


class BarChartPage extends StatelessWidget {
  var year1ParChartController = TextEditingController();
  var year2ParChartController = TextEditingController();
  var year3ParChartController = TextEditingController();
  var year4ParChartController = TextEditingController();
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
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text('Insert # developers per year in Par Chart'),

                    defaultFormField(
                      controller: year1ParChartController,
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
                      controller: year2ParChartController,
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
                      controller: year3ParChartController,
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
                    defaultFormField(
                      controller: year4ParChartController,
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
                        text: 'Save par chart data',
                        function: () {
                          cubit.insertToDatabase(
                              year: "2018",
                              developers: int.parse(year1ParChartController.text),
                              barColor: charts.ColorUtil.fromDartColor(
                                  Colors.green));

                          cubit.insertToDatabase(
                            year: "2019",
                            developers: int.parse(year2ParChartController.text),
                            barColor: charts.ColorUtil.fromDartColor(
                                Colors.green),
                          );

                          cubit.insertToDatabase(
                            year: "2020",
                            developers: int.parse(year3ParChartController.text),
                            barColor: charts.ColorUtil.fromDartColor(
                                Colors.green),
                          );
                          cubit.insertToDatabase(
                            year: "2021",
                            developers: int.parse(year4ParChartController.text),
                            barColor: charts.ColorUtil.fromDartColor(
                                Colors.green),
                          );
                        }),

                    DeveloperChart(
                      index: cubit.currentIndex,
                      data: cubit.barChartData,
                    ),
                  /*  TextButton(
                        onPressed: () {
                          print('bar');
                          *//* setState(() {
                        pressedChartType = 'bar';
                      });*//*
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
                        child: const Text('Line Chart')),
*/

                  ],
                ),
              ),
            ),

        );
      },
    );
  }
}
