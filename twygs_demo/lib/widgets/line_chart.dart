import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/model.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    super.key,
    required this.chartItem,
    required this.startDate,
    required this.endDate,
    required this.dateFormat,
    this.belowGradientColors,
    this.belowColor,
  });

  final Color? belowColor;
  final List<Color>? belowGradientColors;
  final DateTime startDate;
  final DateTime endDate;
  final String dateFormat;
  final LineChartItem chartItem;

  @override
  Widget build(BuildContext context) {
    final spots =
        chartItem.listSpots.map((e) => FlSpot(e.first, e.second)).toList();

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 112 / 60,
          child: LineChart(
            LineChartData(
              lineTouchData: const LineTouchData(enabled: false),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: chartItem.isCurved,
                  barWidth: chartItem.lineWidth,
                  color: chartItem.lineColor,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: belowColor != null || belowGradientColors != null,
                    color: belowColor,
                    gradient: (belowGradientColors != null &&
                            belowGradientColors!.length > 1)
                        ? LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: belowGradientColors!,
                          )
                        : null,
                  ),
                ),
              ],
              minY: 0,
              borderData: FlBorderData(show: false),
              titlesData: const FlTitlesData(
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: const FlGridData(show: false),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat(dateFormat).format(startDate),
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              DateFormat(dateFormat).format(endDate),
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ],
    );
  }
}
