
abstract class AppStates {}

class AppInitialState extends AppStates {}

/*class AppChangeBottomNavBarState extends AppStates {}*/

class AppCreateDatabaseState extends AppStates {}
class AppCreateLineDatabaseState extends AppStates {}
class AppCreatePieDatabaseState extends AppStates {}

class AppGetDatabaseLoadingState extends AppStates {}

class AppGetDatabaseState extends AppStates {
   //DeveloperSeries model;

  AppGetDatabaseState();
}



class AppInsertDatabaseState extends AppStates {}
class AppInsertLineDatabaseState extends AppStates {}
class AppInsertPieDatabaseState extends AppStates {}
class AppChangeChartTypeState extends AppStates {}

class AppGetLineChartDatabaseLoadingState extends AppStates {}
class AppGetLineChartDatabaseState extends AppStates {}

class AppGetPieChartDatabaseLoadingState extends AppStates {}
class AppGetPieChartDatabaseState extends AppStates {}

