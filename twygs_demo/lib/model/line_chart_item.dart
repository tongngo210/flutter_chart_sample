import 'package:flutter/material.dart';
import 'package:twygs_demo/utils/utils.dart';

class LineChartItem {
  final String? name;
  final List<Pair<double, double>> listSpots;
  final Color lineColor;
  final bool isCurved;
  final double lineWidth;

  LineChartItem({
    required this.listSpots,
    required this.lineColor,
    this.name,
    this.isCurved = true,
    this.lineWidth = 1,
  });
}
