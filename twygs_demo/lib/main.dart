import 'package:flutter/material.dart';
import 'package:twygs_demo/utils/pair.dart';
import 'data.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

enum ChartType { simpleLine, multipleLine, pie }

extension ChartTypeExt on ChartType {
  String get title {
    switch (this) {
      case ChartType.simpleLine:
        return 'Simple Line Chart';
      case ChartType.multipleLine:
        return 'Multiple Line Chart';
      case ChartType.pie:
        return 'Pie Chart';
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ChartType selectedChart = ChartType.simpleLine;
  List<ChartType> listCharts = ChartType.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Twygs Demo'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: DropdownBox(
                listItems: listCharts,
                selectedItem: selectedChart,
                onChangedValue: (value) {
                  setState(() {
                    selectedChart = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: chartWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget chartWidget() {
    switch (selectedChart) {
      case ChartType.simpleLine:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: LineChartWidget(
            listSpots: Datas.lineChartData,
            startDate: DateTime.now().subtract(const Duration(days: 30)),
            endDate: DateTime.now(),
            lineColor: const Color(0xFFA6D38D),
            lineWidth: 1,
            belowColor: Colors.amber,
            belowGradientColors: const [Colors.black, Colors.amber],
          ),
        );
      case ChartType.multipleLine:
        return MultipleLineChartWidget(
          listItems: Datas.listMultiLineChartData,
          leftTitle: "Earnings",
          bottomTitle: "Day of the month",
          listYValueTitles: const [0, 10, 20, 30, 40],
          listYValuesForHorizontalLine: const [0, 10, 20, 30, 40],
          listXValuesForVerticalLine: const [0, 1, 5, 7, 8, 10, 20],
          listXValueWithTitles: const [
            Pair(0, '01'),
            Pair(4, '05'),
            Pair(9, '10'),
            Pair(14, '15'),
            Pair(19, '20'),
            Pair(24, '25'),
            Pair(29, '30'),
          ],
        );
      case ChartType.pie:
        return PieChartWidget(
          listItems: Datas.listPieChartData,
          isShownTitle: true,
          isShownPercentage: true,
        );
    }
  }
}
