import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.listItems,
    this.isShownTitle = false,
    this.isShownPercentage = false,
  });

  final List<PieChartItem> listItems;
  final bool isShownTitle;
  final bool isShownPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: pieChartSections(),
              ),
            ),
          ),
        ),
        Expanded(child: _dotItems(listItems)),
      ],
    );
  }

  List<PieChartSectionData> pieChartSections() {
    return List.generate(listItems.length, (i) {
      final percentage = (listItems[i].value /
              (listItems.map((e) => e.value).fold(0, (a, b) => a + b))) *
          100;

      return PieChartSectionData(
        color: listItems[i].color,
        value: listItems[i].value,
        showTitle: isShownTitle,
        title: isShownPercentage
            ? "${percentage.toStringAsFixed(1)}%"
            : listItems[i].name,
        titleStyle: const TextStyle(fontSize: 12),
        radius: 24,
      );
    });
  }

  Widget _dotItems(List<PieChartItem> listChartItems) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in listChartItems)
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: item.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in listChartItems)
              Text(
                "\$${item.value}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
