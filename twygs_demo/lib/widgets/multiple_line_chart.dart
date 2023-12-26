import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:twygs_demo/utils/utils.dart';
import 'package:twygs_demo/model/model.dart';

class MultipleLineChartWidget extends StatelessWidget {
  const MultipleLineChartWidget({
    super.key,
    required this.listItems,
    this.border,
    this.leftTitle,
    this.bottomTitle,
    this.listXValueWithTitles = const [],
    this.listXValuesForVerticalLine = const [],
    this.listYValueTitles = const [],
    this.listYValuesForHorizontalLine = const [],
  });

  final List<LineChartItem> listItems;
  final String? leftTitle;
  final String? bottomTitle;
  final Border? border;
  final List<Pair<double, String>> listXValueWithTitles;
  final List<double> listXValuesForVerticalLine;
  final List<double> listYValueTitles;
  final List<double> listYValuesForHorizontalLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (var item in listItems)
                dotItem(item.lineColor, item.name ?? ''),
            ],
          ),
          AspectRatio(
            aspectRatio: 1.5,
            child: LineChart(
              LineChartData(
                lineTouchData: const LineTouchData(enabled: false),
                lineBarsData: listItems
                    .map((e) => LineChartBarData(
                          spots: e.listSpots
                              .map((e) => FlSpot(e.first, e.second))
                              .toList(),
                          isCurved: e.isCurved,
                          barWidth: e.lineWidth,
                          color: e.lineColor,
                          dotData: const FlDotData(show: false),
                        ))
                    .toList(),
                minY: 0,
                maxY: listYValueTitles.isNotEmpty
                    ? listYValueTitles.reduce(max) + 5
                    : null,
                borderData: (border != null)
                    ? FlBorderData(show: true, border: border)
                    : FlBorderData(
                        show: listYValuesForHorizontalLine.contains(0) ||
                            listXValuesForVerticalLine.contains(0),
                        border: Border(
                          left: listXValuesForVerticalLine.contains(0)
                              ? const BorderSide(color: Colors.black12)
                              : BorderSide.none,
                          bottom: listYValuesForHorizontalLine.contains(0)
                              ? const BorderSide(color: Colors.black12)
                              : BorderSide.none,
                        ),
                      ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: bottomTitleWidgets,
                      reservedSize: 36,
                    ),
                    axisNameWidget: (bottomTitle != null)
                        ? Text(
                            bottomTitle!,
                            style: const TextStyle(fontSize: 10),
                          )
                        : null,
                  ),
                  leftTitles: AxisTitles(
                    axisNameWidget: (leftTitle != null)
                        ? Text(
                            leftTitle!,
                            style: const TextStyle(fontSize: 10),
                          )
                        : null,
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: leftTitleWidgets,
                      interval: 1,
                      reservedSize: 30,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: listXValuesForVerticalLine.isNotEmpty,
                  drawHorizontalLine: listYValuesForHorizontalLine.isNotEmpty,
                  horizontalInterval: 1,
                  verticalInterval: 1,
                  checkToShowHorizontalLine: (value) {
                    return listYValuesForHorizontalLine.contains(value);
                  },
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(color: Colors.black12, strokeWidth: 1);
                  },
                  checkToShowVerticalLine: (value) {
                    return listXValuesForVerticalLine.contains(value);
                  },
                  getDrawingVerticalLine: (value) {
                    return const FlLine(color: Colors.black12, strokeWidth: 1);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dotItem(Color dotColor, String title) {
    return Row(
      children: [
        const SizedBox(width: 12),
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 11),
        )
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    if (listXValueWithTitles.map((e) => e.first).contains(value)) {
      text = listXValueWithTitles.firstWhere((e) => e.first == value).second;
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(text, style: const TextStyle(fontSize: 10)),
        ),
      );
    }
    return const SizedBox();
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    if (listYValueTitles.contains(value)) {
      text = value.toInt().toString();
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          '\$$text',
          style: const TextStyle(fontSize: 10),
        ),
      );
    }
    return const SizedBox();
  }
}
