import 'package:flutter_chart_sample/DeveloperSeries.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

/*class AppChangeBottomNavBarState extends AppStates {}*/

class AppCreateDatabaseState extends AppStates {}

class AppGetDatabaseLoadingState extends AppStates {}

class AppGetDatabaseState extends AppStates {
   //DeveloperSeries model;

  AppGetDatabaseState(model);
}

class AppInsertDatabaseState extends AppStates {}

/*class AppUpdateDatabaseState extends AppStates {}

class AppDeleteDatabaseState extends AppStates {}

class AppChangeBottomSheetState extends AppStates {}*/
