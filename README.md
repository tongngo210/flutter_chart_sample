# Chart Samples

### [Common] Pair (Tuple)
|PropName|Description|
|:-------|:----------|
|first|Represent first element of the object|
|second|Represent second element of the object|

---
## Line Chart
![IMG_6F1ECE201F38-1](https://github.com/tongngo210/twygs_demo/assets/97073254/f927407d-e556-4cb6-9981-a69c91b19825)

### How to Use

```dart
LineChartWidget(
    chartItem: LineChartItem(
        listSpots: [Pair(0, 4), Pair(1, 3.5), Pair(2, 4.5), Pair(3, 3) ],
        lineColor: const Color(0xFFA6D38D),
        lineWidth: 3,
    ),
    startDate: DateTime.now().subtract(const Duration(days: 30)),
    endDate: DateTime.now(),
    dateFormat: 'MMM dd, yyyy',
    belowColor: Colors.amber,
)
```
### LineChartItem
|PropName	   	 |Value type   |Description	 |Required     |Default value|
|:---------------|:------------|:------------|:------------|:------------|
|listSpots|List<Pair<double, double>>|list of [Pair](#Pair) that presents x and y in xy coordinates|Yes|
|name|String? |the name presents the data| No| null
|lineColor|Color |the color of the line| Yes|
|lineWidth|double |the stroke width of the line| No| 1.0|
|isCurved|bool |curves the corners of the line on the spot's positions | No| true|

### LineChartWidget
|PropName	   	 |Value type   |Description	 |Required     |Default value|
|:---------------|:------------|:------------|:------------|:------------|
|chartItem|LineChartItem |the [LineChartItem](#LineChartItem) data to show| Yes|
|startDate|DateTime |the first date of selected date range to show| Yes|
|endDate|DateTime |the last date of selected date range to show| Yes|
|dateFormat|String |the date format type to show| Yes|
|belowColor|Color? |the color of the below line area| No| null|
|belowGradientColors|List<Color>? |the gradient colors of the below line area, this property is prioritized first before the belowColor. You can use any Gradient here, such as LinearGradient or RadialGradient| No| null|

---
## Multiple Lines Chart

![IMG_E712B2A481AD-1](https://github.com/tongngo210/twygs_demo/assets/97073254/5573526c-abd1-49cf-8d58-c0bf1ffcb1a8)
### How to Use
```dart
MultipleLineChartWidget(
    listItems: [
        LineChartItem(
            listSpots: const [ Pair(0, 2), Pair(1, 4) ],
            lineColor: Colors.red,
            name: 'Canada',
        ),
        LineChartItem(
            listSpots: const [ Pair(0, 12), Pair(1, 14) ],
            lineColor: Colors.blue,
            name: 'United States',
        ),
    ],
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
)
```

### MultipleLineChartWidget
|PropName	   	 |Value type   |Description	 |Required     |Default value|
|:---------------|:------------|:------------|:------------|:------------|
|listItems|List<LineChartItem>|list of [LineChartItem](#LineChartItem) data to show|Yes|
|leftTitle|String? |The title of the left axis| No| null
|bottomTitle|String? |The title of the bottom axis| No| null
|border|Border? |Border details that determines which border should be drawn with which color | No| null
|listXValueWithTitles|List<Pair<double, String>> |the list of x positions in coordinator with the titles to show at bottom axis |No|[]|
|listXValuesForVerticalLine|List<double> |the list of x positions in coordinator to show vertical line| No|[]|
|listYValueTitles|List<double> |the list of y positions in coordinator to show the values at left axis | No|[]|
|listYValuesForHorizontalLine|List<double> |the list of y positions in coordinator to show horizontal line| No|[]|

--- 
## Pie Chart
![IMG_D149CF00185F-1](https://github.com/tongngo210/twygs_demo/assets/97073254/68f76063-6cea-4788-bc8f-56343bb5f2a6)
### How to Use
```dart
PieChartWidget(
    listItems: [
        PieChartItem(
          name: 'Mobile',
          value: 1234.56,
          color: const Color(0xFFDF1674),
        ),
        PieChartItem(
          name: 'Desktop',
          value: 735.82,
          color: const Color(0xFFA6D38D),
        ),
        PieChartItem(
          name: 'Tablet',
          value: 38.12,
          color: const Color(0xFF9B7BFF),
        ),
    ],
    isShownTitle: true,
    isShownPercentage: true,
)
```
### PieChartItem
|PropName	   	 |Value type   |Description	 |Required     |
|:---------------|:------------|:------------|:------------|
|name|String |the name presents the data| Yes| 
|value|Color |the value of the data| Yes|
|color|double |the color of the data| Yes|

### PieChartWidget
|PropName	   	 |Value type   |Description	 |Required     |Default value|
|:---------------|:------------|:------------|:------------|:------------|
|listItems|List<PieChartItem>|list of [PieChartItem](#PieChartItem) data to show|Yes|
|isShownTitle|bool |show the title which is defined in the PieChartItem object| No| false
|isShownPercentage|bool |show the percentage based on the value which is defined in the PieChartItem object with total value| No| false
