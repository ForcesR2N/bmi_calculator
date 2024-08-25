import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MySlider extends StatelessWidget {
  final double weight;
  final double min;
  final double max;
  final bool showTicks;
  final bool showLabels;
  final bool enableTooltip;
  final int height;
  final int width;
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
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
            "${weight.toStringAsFixed(0)} KG",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SfSlider(
            min: 0.0,
            max: 200.0,
            value: weight,
            interval: 20,
            showTicks: false,
            showLabels: false,
            enableTooltip: false,
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
