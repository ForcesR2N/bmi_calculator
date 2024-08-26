import 'package:flutter/material.dart';
import 'package:bmi_calculator/component/my_gender.dart';
import 'package:bmi_calculator/component/my_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedGender = 0;
  double _height = 0.0;
  double _weight = 0.0;
  double? _bmi;
  String? _bmiMessage;

  void _calculateBMI() {
    if (_height > 0 && _weight > 0) {
      setState(() {
        _bmi = _weight / (_height * _height) * 10000;
        if (_bmi == null) {
          _bmiMessage = "";
        } else if (_bmi! < 18.5) {
          _bmiMessage = "Underweight";
        } else if (_bmi! < 24.9) {
          _bmiMessage = "Normal";
        } else if (_bmi! < 29.9) {
          _bmiMessage = "Overweight";
        } else {
          _bmiMessage = "Obesity";
        }
      });
      _showBmiResult();
    } else {
      setState(() {
        _bmi = null;
        _bmiMessage = '';
      });
    }
  }

  void _showBmiResult() {
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
                  "Your BMI is: ${_bmi?.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 22, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                Text(
                  _bmiMessage ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green, // Gojek green
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green, // Gojek green
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
    );
  }

  Widget _genderSelector() {
    return MyGender(
      selectGender: _selectedGender,
      onGenderSelected: (gender) {
        setState(() {
          _selectedGender = gender;
        });
      },
    );
  }

  Widget _heightSelector() {
    return MySlider(
      value: _height,
      onChanged: (newHeight) {
        setState(() {
          _height = newHeight;
        });
      },
      min: 0.0,
      max: 200.0,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      height: 400,
      width: double.infinity,
      isVertical: true,
      showImage: true,
      text: "${_height.toStringAsFixed(0)} CM",
    );
  }

  Widget _weightSelector() {
    return MySlider(
      value: _weight,
      text: "${_weight.toStringAsFixed(0)} KG",
      onChanged: (newWeight) {
        setState(() {
          _weight = newWeight;
        });
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
      onPressed: _calculateBMI,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Gojek green
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
