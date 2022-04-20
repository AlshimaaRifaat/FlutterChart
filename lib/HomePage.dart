import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chart_sample/DeveloperChart.dart';
import 'package:flutter_chart_sample/DeveloperSeries.dart';
import 'package:flutter_chart_sample/base/cubit.dart';
import 'package:flutter_chart_sample/base/states.dart';

class HomePage extends StatelessWidget {
  List<DeveloperSeries> data;

  /*final List<DeveloperSeries> data = [

   DeveloperSeries(
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "2018",
      developers: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "2019",
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "2020",
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "2021",
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];*/

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
        },
        builder: (context, state) {

          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                cubit.insertToDatabase(
                    year: '2018',
                    developers: 4000,
                    barColor: charts.ColorUtil.fromDartColor(Colors.green));

                cubit.insertToDatabase(
                  year: "2019",
                  developers: 5000,
                  barColor: charts.ColorUtil.fromDartColor(Colors.green),
                );

                cubit.insertToDatabase(
                  year: "2020",
                  developers: 35000,
                  barColor: charts.ColorUtil.fromDartColor(Colors.green),
                );
                cubit.insertToDatabase(
                  year: "2021",
                  developers: 50000,
                  barColor: charts.ColorUtil.fromDartColor(Colors.green),
                );
              },
            ),

            body: Center(
                child: DeveloperChart(
              data: cubit.list,
            )),

          );
        });
/*    return BlocProvider( create: (BuildContext context) => AppCubit()..createDatabase()
      ,
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {

        },
    builder: (BuildContext context, AppStates state) {



   */ /* cubit.insertToDatabase(
      year: "2019",
      developers: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    );

    cubit.insertToDatabase(
      year: "2020",
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    );
    cubit.insertToDatabase(
      year: "2021",
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    );
*/ /*
 */ /*  List<DeveloperSeries> list= cubit.doneTasks.iterator.current.entries.map((entry)
    => DeveloperSeries()).toList();*/ /*


    //List<DeveloperSeries> list=cubit.doneTasks.cast().add(data);
      AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      body: Center(
          child: DeveloperChart(
            data: cubit.list
          )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          cubit.insertToDatabase(
              year: '2018',
              developers: 4000,
              barColor: charts.ColorUtil.fromDartColor(Colors.green));

          cubit.insertToDatabase(
            year: "2019",
            developers: 5000,
            barColor: charts.ColorUtil.fromDartColor(Colors.green),
          );

          cubit.insertToDatabase(
            year: "2020",
            developers: 35000,
            barColor: charts.ColorUtil.fromDartColor(Colors.green),
          );
          cubit.insertToDatabase(
            year: "2021",
            developers: 50000,
            barColor: charts.ColorUtil.fromDartColor(Colors.green),
          );

        },
      ),
    );

    },

    ),
    );*/
  }
}
