import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedGender = 0, _height = 170, _weight = 50, _age = 15;
double _bmi = 0;

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
        child: Icon(
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
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$_height cm"),
          RotatedBox(
            quarterTurns: 3,
            child: Slider(
              min: 0,
              max: 240,
              value: _height.toDouble(),
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
