import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return BlocProvider( create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {


        },
        builder: (BuildContext context, AppStates state) {

          return MaterialApp(
              theme: ThemeData(
                inputDecorationTheme: const InputDecorationTheme(
              border:OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 1
                  )


          ),
              primarySwatch: Colors.green,
              colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
          ).copyWith(),
              ),

          debugShowCheckedModeBanner: false,

            home: HomePage(),

          );

        },

      ),
    );
  }

}