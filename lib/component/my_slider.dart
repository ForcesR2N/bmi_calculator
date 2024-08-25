import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MySlider extends StatelessWidget {
  final double weight;
  final double min;
  final double max;
  final String text;
  final bool showTicks;
  final bool showLabels;
  final bool enableTooltip;
  final double height;
  final double width;
  final bool isVertical;
  final ValueChanged<double> onChanged;

  const MySlider(
      {super.key,
      required this.weight,
      required this.onChanged,
      required this.min,
      required this.max,
      required this.showTicks,
      required this.showLabels,
      required this.enableTooltip,
      required this.height,
      required this.width,
      required this.text,
      required this.isVertical});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          isVertical
              ? Expanded(
                  child: SfSlider.vertical(
                    min: min,
                    max: max,
                    value: weight,
                    interval: 20,
                    showTicks: showTicks,
                    showLabels: showLabels,
                    enableTooltip: enableTooltip,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value) {
                      onChanged(value as double);
                    },
                  ),
                )
              : SfSlider(
                  min: min,
                  max: max,
                  value: weight,
                  interval: 20,
                  showTicks: showTicks,
                  showLabels: showLabels,
                  enableTooltip: enableTooltip,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value) {
                    onChanged(value as double);
                  },
                ),
        ],
      ),
    );
  }
}
