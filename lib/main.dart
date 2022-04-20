import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chart_sample/DeveloperChart.dart';
import 'package:flutter_chart_sample/HomePage.dart';
import 'package:flutter_chart_sample/base/cubit.dart';
import 'package:flutter_chart_sample/base/states.dart';

void main()
{
  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {
   /* return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );*/
    return BlocProvider( create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {


        },
        builder: (BuildContext context, AppStates state) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),

          );

        },

      ),
    );
  }

}