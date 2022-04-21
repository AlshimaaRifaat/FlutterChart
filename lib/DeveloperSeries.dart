import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class DeveloperSeries {
  int yearNum;
  String year;

   int developers;
  final charts.Color barColor;

  DeveloperSeries(
      {
        this.yearNum,
        this.year,
        @required this.developers,
        @required this.barColor,
      }
      );
}