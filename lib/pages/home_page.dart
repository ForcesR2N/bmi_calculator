import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_calculator/component/my_gender.dart';
import 'package:bmi_calculator/component/my_slider.dart';
import 'package:bmi_calculator/bloc/counter_bloc.dart';
import 'package:bmi_calculator/bloc/counter_state.dart';
import 'package:bmi_calculator/bloc/counter_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _showBmiResult(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterBmiCalculated) {
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
                        state.bmiMessage ?? '',
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
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              _genderSelector(),
              const SizedBox(height: 20),
              _heightSelector(),
              const SizedBox(height: 40),
              _weightSelector(),
              const SizedBox(height: 20),
              _calculateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderSelector() {
    return MyGender(
      selectGender: 0, // Default value
      onGenderSelected: (gender) {
        context.read<CounterBloc>().add(GenderSelectedEvent(gender));
      },
    );
  }

  Widget _heightSelector() {
    return MySlider(
      value: 0.0,
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
      text: "${context.read<CounterBloc>().state.height.toStringAsFixed(0)} CM",
    );
  }

  Widget _weightSelector() {
    return MySlider(
      value: 0.0,
      text: "${context.read<CounterBloc>().state.weight.toStringAsFixed(0)} KG",
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

  Widget _calculateButton() {
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
}
