import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chart_sample/DeveloperChart.dart';
import 'package:flutter_chart_sample/base/components.dart';
import 'package:flutter_chart_sample/base/cubit.dart';
import 'package:flutter_chart_sample/base/states.dart';
import 'package:flutter_chart_sample/module/BarChartPage.dart';
import 'package:flutter_chart_sample/module/LineChartPage.dart';
import 'package:flutter_chart_sample/module/PieChartpage.dart';

class HomePage extends StatelessWidget {
 var year1ParChartController = TextEditingController();
 var year2ParChartController = TextEditingController();
 var year3ParChartController = TextEditingController();
 var year4ParChartController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider( create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {


        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
           /*   body: Padding(
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
                *//*  validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter Number of developers in 2018';
                          }
                        },*//*

                label: 'enter number of developers in 2018',
               ),
               const SizedBox(
                height: 5.0,
               ),
               defaultFormField(
                controller: year2ParChartController,
                style: const TextStyle(fontSize: 14.0),
                type: TextInputType.number,
                *//*  validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter Number of developers in 2018';
                          }
                        },*//*

                label: 'enter number of developers in 2019',
               ),
               const SizedBox(
                height: 5.0,
               ),
               defaultFormField(
                controller: year3ParChartController,
                style: const TextStyle(fontSize: 14.0),
                type: TextInputType.number,
                *//*  validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter Number of developers in 2018';
                          }
                        },*//*

                label: 'enter number of developers in 2020',
               ),
               const SizedBox(
                height: 5.0,
               ),
               defaultFormField(
                controller: year4ParChartController,
                style: const TextStyle(fontSize: 14.0),
                type: TextInputType.number,
                *//*  validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter Number of developers in 2018';
                          }
                        },*//*

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




              ],
             ),
            ),
           ),
           ),*/

            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),

            ),

            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bar_chart,
                  ),
                  label: 'Bar chart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.pie_chart,
                  ),
                  label: 'Pie Chart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.multiline_chart,
                  ),
                  label: 'Line Chart',
                ),
              ],
            ),
          );

        },

      ),
    );
  }
}

