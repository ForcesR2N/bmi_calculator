import 'package:bmi_calculator/component/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MySlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final String text;
  final bool showTicks;
  final bool showLabels;
  final bool enableTooltip;
  final double height;
  final double width;
  final bool isVertical;
  final bool showImage;
  final ValueChanged<double> onChanged;

  const MySlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
    required this.showTicks,
    required this.showLabels,
    required this.enableTooltip,
    required this.height,
    required this.width,
    required this.text,
    required this.isVertical,
    this.showImage = false,
  });

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
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: isVertical
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: SfSlider.vertical(
                            min: min,
                            max: max,
                            value: value,
                            interval: 20,
                            showTicks: showTicks,
                            showLabels: showLabels,
                            enableTooltip: enableTooltip,
                            minorTicksPerInterval: 1,
                            activeColor: AppColor.mainColor,
                            inactiveColor: Colors.grey,
                            onChanged: (dynamic value) {
                              onChanged(value as double);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (showImage) ...[
                  const SizedBox(width: 16),
                  Image.asset(
                    'lib/images/human_height.png',
                    height: height.toDouble(),
                    fit: BoxFit.cover,
                  ),
                ],
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SfSlider(
                    min: min,
                    max: max,
                    value: value,
                    interval: 20,
                    showTicks: showTicks,
                    showLabels: showLabels,
                    enableTooltip: enableTooltip,
                    minorTicksPerInterval: 1,
                    activeColor: AppColor.mainColor,
                    inactiveColor: Colors.grey,
                    onChanged: (dynamic value) {
                      onChanged(value as double);
                    },
                    thumbIcon: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.mainColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
