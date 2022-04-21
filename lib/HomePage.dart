import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chart_sample/DeveloperChart.dart';
import 'package:flutter_chart_sample/base/components.dart';
import 'package:flutter_chart_sample/base/cubit.dart';
import 'package:flutter_chart_sample/base/states.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String pressedChartType = "bar";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var year1ParChartController = TextEditingController();
    var year2ParChartController = TextEditingController();
    var year3ParChartController = TextEditingController();
    var year4ParChartController = TextEditingController();

    var year1LineChartController = TextEditingController();
    var year2LineChartController = TextEditingController();
    var year3LineChartController = TextEditingController();
    var year4LineChartController = TextEditingController();

    var year1PieChartController = TextEditingController();
    var year2PieChartController = TextEditingController();
    var year3PieChartController = TextEditingController();
    var year4PieChartController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          if (cubit.currentChartType == 'bar') {
            return Scaffold(

              body: Padding(
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
                          chartType: cubit.currentChartType,
                          data: cubit.barChartData,
                        ),
                        TextButton(
                            onPressed: () {
                              print('bar');
                              /* setState(() {
                        pressedChartType = 'bar';
                      });*/
                              cubit.changeChartType('bar');
                            },
                            child: const Text('Bar Chart')),

                        TextButton(
                            onPressed: () {
                              print('pie');


                              cubit.changeChartType('pie');
                            },
                            child: const Text('Pie Chart')),
                        TextButton(
                            onPressed: () {
                              print('Line Chart');

                            cubit.changeChartType('line');
                            },
                            child: const Text('Line Chart')),


                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          else if(cubit.currentChartType=='line') {
            return Scaffold(

              body: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Insert # developers per year in Line Chart'),
                        defaultFormField(
                          controller: year1LineChartController,
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
                          controller: year2LineChartController,
                          style: const TextStyle(fontSize: 14.0),
                          type: TextInputType.number,
                          /*  validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter Number of developers in 2018';
                          }
                        },*/

                          label: ' enter number of developers in 2019',
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        defaultFormField(
                          controller: year3LineChartController,
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
                          controller: year4LineChartController,
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
                          text: 'Save line chart data',
                          function: () {

                            cubit.insertLineChartDataToDatabase(
                                year: 2018,
                                developers: int.parse(year1LineChartController.text),
                                barColor:
                                charts.ColorUtil.fromDartColor(Colors.green));

                            cubit.insertLineChartDataToDatabase(
                              year: 2019,
                              developers: int.parse(year2LineChartController.text),
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            );

                            cubit.insertLineChartDataToDatabase(
                              year: 2020,
                              developers: int.parse(year3LineChartController.text),
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            );
                            cubit.insertLineChartDataToDatabase(
                              year: 2021,
                              developers: int.parse(year4LineChartController.text),
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            );


                          },
                        ),
                        DeveloperChart(
                          chartType: cubit.currentChartType,
                          data: cubit.lineChartData,
                        ),

                        TextButton(
                            onPressed: () {
                              print('bar');
                              /* setState(() {
                        pressedChartType = 'bar';
                      });*/
                              cubit.changeChartType('bar');
                            },
                            child: const Text('Bar Chart')),

                        TextButton(
                            onPressed: () {
                              print('pie');

                              /*   setState(() {
                        pressedChartType = 'pie';
                      });*/
                              cubit.changeChartType('pie');
                            },
                            child: const Text('Pie Chart')),
                        TextButton(
                            onPressed: () {
                              print('Line Chart');

                              /*  setState(() {
                        pressedChartType = 'line';
                      });*/
                              cubit.changeChartType('line');
                            },
                            child: const Text('Line Chart')),


                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          else if(cubit.currentChartType=='pie'){
            return Scaffold(

              body: Padding(
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
                            chartType: cubit.currentChartType,
                            data: cubit.pieChartData,
                          ),


                        TextButton(
                            onPressed: () {
                              print('bar');

                              cubit.changeChartType('bar');
                            },
                            child: const Text('Bar Chart')),

                        TextButton(
                            onPressed: () {
                              print('pie');
                              cubit.changeChartType('pie');
                            },
                            child: const Text('Pie Chart')),
                        TextButton(
                            onPressed: () {
                              print('Line Chart');

                              cubit.changeChartType('line');
                            },
                            child: const Text('Line Chart')),



                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
