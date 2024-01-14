/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  const SimpleBarChart(this.seriesList, {super.key, this.animate = false});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData(List<int> list) {
    return SimpleBarChart(
      _createSampleData(list),
      // Disable animations for image tests.
      animate: false,
    );
  }

  factory SimpleBarChart.withSecondleData(List<int> list) {
    return SimpleBarChart(
      _createSecondleData(list),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData(List<int> list) {
    final data = [
      OrdinalSales('4 months ago', list[3]),
      OrdinalSales('3 months ago', list[2]),
      OrdinalSales('2 months ago', list[1]),
      OrdinalSales('1 month ago', list[0]),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

List<charts.Series<OrdinalSales, String>> _createSecondleData(List<int> list) {
  final data = [
    OrdinalSales('4 months ago', list[3]),
    OrdinalSales('3 months ago', list[2]),
    OrdinalSales('2 months ago', list[1]),
    OrdinalSales('1 month ago', list[0]),
  ];

  return [
    charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: data,
    )
  ];
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}


