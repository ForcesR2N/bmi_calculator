import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedGender = 0, _age = 15;
double _bmi = 0, _height = 170.0, _weight = 50;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: _BuildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.calculate,
        ),
      ),
    );
  }

  Widget _BuildUI() {
    return Column(
      children: [
        _genderSelector(),
        const SizedBox(height: 20),
        _heightSelector(),
        _weightSelector(),
      ],
    );
  }

  Widget _genderSelector() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedGender = 0;
                  });
                },
                iconSize: 70,
                icon: Icon(
                  Icons.male_rounded,
                  color: _selectedGender == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                ),
              ),
              const Text(
                "Male",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _selectedGender = 1;
                  });
                },
                iconSize: 70,
                icon: Icon(
                  Icons.female_rounded,
                  color: _selectedGender == 1
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                ),
              ),
              const Text(
                "Female",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heightSelector() {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_height.toStringAsFixed(0)} CM",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(
                    width: 120,
                  ),
                  Image.asset(
                    'lib/images/human_height.png',
                    height: 320,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _weightSelector() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${_weight.toStringAsFixed(0)}KG",
            style: TextStyle(fontSize: 30),
          ),
          Container(
            height: 50,
            width: 350,
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
          )
        ],
      ),
    );
  }
}
