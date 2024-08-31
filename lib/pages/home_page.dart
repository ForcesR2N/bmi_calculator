import 'package:bmi_calculator/bloc/counter_bloc.dart';
import 'package:bmi_calculator/bloc/counter_event.dart';
import 'package:bmi_calculator/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_calculator/component/my_gender.dart';
import 'package:bmi_calculator/component/my_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            _genderSelector(context),
            const SizedBox(height: 20),
            _heightSelector(context),
            const SizedBox(height: 40),
            _weightSelector(context),
            const SizedBox(height: 20),
            _calculateButton(context),
          ],
        ),
      ),
    );
  }

  Widget _genderSelector(BuildContext context) {
    final selectedGender = context.watch<CounterBloc>().state.selectedGender;

    return MyGender(
      selectGender: selectedGender,
      onGenderSelected: (gender) {
        context.read<CounterBloc>().add(GenderSelectedEvent(gender));
      },
    );
  }

  Widget _heightSelector(BuildContext context) {
    final height = context.watch<CounterBloc>().state.height;

    return MySlider(
      value: height,
      onChanged: (newHeight) {
        context.read<CounterBloc>().add(HeightChangedEvent(newHeight));
      },
      min: 0.0,
      max: 200.0,
      showTicks: true,
      showLabels: true,
      enableTooltip: false,
      height: 400,
      width: double.infinity,
      isVertical: true,
      showImage: true,
      text: "${height.toStringAsFixed(0)} CM",
    );
  }

  Widget _weightSelector(BuildContext context) {
    final weight = context.watch<CounterBloc>().state.weight;

    return MySlider(
      value: weight,
      text: "${weight.toStringAsFixed(0)} KG",
      onChanged: (newWeight) {
        context.read<CounterBloc>().add(WeightChangedEvent(newWeight));
      },
      min: 0.0,
      max: 200.0,
      showTicks: false,
      showLabels: false,
      enableTooltip: false,
      height: 120,
      isVertical: false,
      width: double.infinity,
      showImage: false,
    );
  }

  Widget _calculateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CounterBloc>().add(CalculateBmiEvent());
        _showBmiResult(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text('Calculate BMI', style: TextStyle(fontSize: 20)),
    );
  }

  void _showBmiResult(BuildContext context) {
    final state = context.read<CounterBloc>().state;

    if (state is CounterBmiCalculated) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'BMI Result',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Your BMI is : ${state.bmi.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 22, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    state.bmiMessage,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
