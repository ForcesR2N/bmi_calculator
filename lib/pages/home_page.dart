import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedGender = 0;
  double _height = 170.0;
  double _weight = 50;
  int _age = 15;
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
      floatingActionButton: FloatingActionButton(
        onPressed: _calculateBMI,
        child: const Icon(
          Icons.calculate,
        ),
      ),
    );
  }

  Widget _genderSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _genderIcon(
          gender: "Male",
          icon: Icons.male_rounded,
          isSelected: _selectedGender == 0,
          onTap: () => setState(() => _selectedGender = 0),
        ),
        _genderIcon(
          gender: "Female",
          icon: Icons.female_rounded,
          isSelected: _selectedGender == 1,
          onTap: () => setState(() => _selectedGender = 1),
        ),
      ],
    );
  }

  Widget _genderIcon({
    required String gender,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        IconButton(
          iconSize: 70,
          icon: Icon(icon,
              color:
                  isSelected ? Theme.of(context).primaryColor : Colors.black),
          onPressed: onTap,
        ),
        Text(gender, style: const TextStyle(fontSize: 20)),
      ],
    );
  }

  Widget _heightSelector() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${_height.toStringAsFixed(0)} CM",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 320,
                width: 70,
                child: SfSlider.vertical(
                  min: 0.0,
                  max: 200.0,
                  value: _height,
                  interval: 20,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value) {
                    setState(() {
                      _height = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 50),
              Image.asset(
                'lib/images/human_height.png',
                height: 320,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weightSelector() {
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
            "${_weight.toStringAsFixed(0)} KG",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            width: double.infinity,
            child: SfSlider(
              min: 0.0,
              max: 200.0,
              value: _weight,
              interval: 20,
              showTicks: false,
              showLabels: false,
              enableTooltip: false,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _calculateButton() {
    return ElevatedButton(
      onPressed: _calculateBMI,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text('Calculate BMI', style: TextStyle(fontSize: 20)),
    );
  }

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
    });
  }
}
