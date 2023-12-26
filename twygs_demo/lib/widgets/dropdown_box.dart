import 'package:flutter/material.dart';

import 'package:twygs_demo/main.dart';

class DropdownBox extends StatelessWidget {
  const DropdownBox({
    super.key,
    required this.listItems,
    required this.selectedItem,
    required this.onChangedValue,
  });

  final List<ChartType> listItems;
  final ChartType selectedItem;
  final ValueChanged<ChartType> onChangedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            iconSize: 0.0,
            dropdownColor: Colors.white,
            value: selectedItem,
            items: listItems.map((ChartType chartType) {
              return DropdownMenuItem<ChartType>(
                value: chartType,
                child: Text(chartType.title),
              );
            }).toList(),
            onChanged: (chartType) {
              if (chartType != null) {
                onChangedValue(chartType);
              }
            },
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
