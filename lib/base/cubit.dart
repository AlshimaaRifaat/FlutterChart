import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chart_sample/DeveloperSeries.dart';
import 'package:flutter_chart_sample/base/states.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  /*List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];*/

 /* List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }*/

  Database database;
 // List<Map> newTasks = [];
  //List<Map> doneTasks = [];
  List<DeveloperSeries> list = [];
 // List<Map> archivedTasks = [];
//DeveloperSeries model;
  void createDatabase() {
    openDatabase(
      'sample.db',
      version: 1,
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
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
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
  })  async {
   await  database.transaction((txn) {
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


//List<DeveloperSeries> list=[];
  void getDataFromDatabase(database)
  {
   // newTasks = [];
    //doneTasks = [];

   // archivedTasks = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM sample').then((value) {

      DeveloperSeries model;

      value.forEach((element)
      {
         model=DeveloperSeries(year: element['year'], developers: element['developers'],barColor: ColorUtil.fromDartColor(Colors.green) );
       /* if(element['status'] == 'new')
          newTasks.add(element);
        else if(element['status'] == 'done')*/

          list.add(model);
         // doneTasks.add(element);

    //    else archivedTasks.add(element);
      });
      print('list '+list.length.toString());
      emit(AppGetDatabaseState(model));

    });
  }


 /* void deleteData({
    @required int id,
  }) async
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    @required bool isShow,
    @required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }*/
}
