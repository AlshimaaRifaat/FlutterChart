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

