import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chart_sample/DeveloperSeries.dart';
import 'package:flutter_chart_sample/base/states.dart';
import 'package:flutter_chart_sample/module/BarChartPage.dart';
import 'package:flutter_chart_sample/module/LineChartPage.dart';
import 'package:flutter_chart_sample/module/PieChartpage.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    BarChartPage(),
    PieChartPage(),
    LineChartPage(),
  ];

  List<String> titles = [
    'Bar chart',
    'Pie Chart',
    'Line Chart',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }


  Database database;

  List<DeveloperSeries> lineChartData = [];
  List<DeveloperSeries> barChartData = [];
  List<DeveloperSeries> pieChartData = [];

  void createDatabase() {
    openDatabase(
      'sample.db',
      version: 2,
      onCreate: (database, version) {
        // id integer
        // title String
        // date String
        // time String
        // status String

        print('database created');
        database
            .execute(
                'CREATE TABLE sample (id INTEGER PRIMARY KEY, year TEXT, developers INTEGER )')
            .then((value) {
          print('table  bar created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });

        database
            .execute(
            'CREATE TABLE PieChart (id INTEGER PRIMARY KEY, year TEXT, developers INTEGER )')
            .then((value) {
          print('table pie created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });

        database
            .execute(
            'CREATE TABLE LineChart ( id INTEGER PRIMARY KEY, year INTEGER , developers INTEGER )')
            .then((value) {
          print('table line created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });


      },
      onOpen: (database) {
        getDataFromDatabase(database);
        getLineChartDataFromDatabase(database);
        getPieChartDataFromDatabase(database);

        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());

    });
  }

  insertToDatabase({
    @required String year,
    @required int developers,
    @required dynamic barColor,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO sample(year, developers) VALUES( "$year", "$developers" )',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  insertLineChartDataToDatabase({
    @required int year,
    @required int developers,
    @required dynamic barColor,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO LineChart(year, developers) VALUES( $year, "$developers" )',
      )
          .then((value) {
        print('$value inserted successfully');

        emit(AppInsertLineDatabaseState());

        getLineChartDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  insertPieChartDataToDatabase({
    @required String year,
    @required int developers,
    @required dynamic barColor,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO PieChart(year, developers) VALUES( "$year", "$developers" )',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertPieDatabaseState());

        getPieChartDataFromDatabase(database);
        print('pie inserted');
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  void getDataFromDatabase(database) {
    barChartData = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM sample').then((value) {


        value.forEach((element) {
          DeveloperSeries model = DeveloperSeries(
              year: element['year'],
              developers: element['developers'],
              barColor: ColorUtil.fromDartColor(Colors.green));

          barChartData.add(model);
        });

      emit(AppGetDatabaseState());
    });
  }

  void getLineChartDataFromDatabase(database) {

    emit(AppGetLineChartDatabaseLoadingState());

    database.rawQuery('SELECT * FROM LineChart').then((value) {
      lineChartData = [];
        value.forEach((element) {
          DeveloperSeries  model = DeveloperSeries(
              yearNum: element['year'],
              developers: element['developers'],
              barColor: ColorUtil.fromDartColor(Colors.green));

          lineChartData.add(model);
        });

       print("line data: "+lineChartData.toString());
      emit(AppGetLineChartDatabaseState());
    });
  }


  void getPieChartDataFromDatabase(database) {

    emit(AppGetPieChartDatabaseLoadingState());

    database.rawQuery('SELECT * FROM PieChart').then((value) {
      pieChartData = [];

      value.forEach((element) {
      DeveloperSeries   model = DeveloperSeries(
            year: element['year'],
            developers: element['developers'],
            barColor: ColorUtil.fromDartColor(Colors.green));

        pieChartData.add(model);
      });

        print('pie data: '+pieChartData.length.toString());
      emit(AppGetPieChartDatabaseState());
    });
  }


  void deleteLineChartData() async
  {
    database.rawDelete('DELETE FROM LineChart ')
        .then((value)
    {
      //getDataFromDatabase(database);
      emit(DeleteLineChartDatabaseState());
    });
  }
  void deletePieChartData() async
  {
    database.rawDelete('DELETE FROM PieChart ')
        .then((value)
    {

      emit(DeletePieChartDatabaseState());
    });
  }
  void deleteParChartData() async
  {
    database.rawDelete('DELETE FROM sample ')
        .then((value)
    {

      emit(DeleteParChartDatabaseState());
    });
  }

}
