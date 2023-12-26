import 'package:flutter/material.dart';
import 'package:twygs_demo/utils/utils.dart';

class LineChartItem {
  final String? name;
  final List<Pair<double, double>> listXYs;
  final Color lineColor;
  final bool isCurved;
  final double barWidth;

  LineChartItem({
    required this.listXYs,
    required this.lineColor,
    this.name,
    this.isCurved = true,
    this.barWidth = 1,
  });
}
