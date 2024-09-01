import 'package:bmi_calculator/component/my_colors.dart';
import 'package:flutter/material.dart';

class MyGender extends StatelessWidget {
  final int selectGender;
  final ValueChanged<int> onGenderSelected;
  const MyGender(
      {super.key, required this.selectGender, required this.onGenderSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _genderIcon(
            context: context,
            gender: "Male",
            icon: Icons.male_rounded,
            isSelected: selectGender == 0,
            onTap: () => onGenderSelected(0),
          ),
          _genderIcon(
              context: context,
              gender: "Female",
              icon: Icons.female,
              isSelected: selectGender == 1,
              onTap: () => onGenderSelected(1)),
          _genderIcon(
              context: context,
              gender: "Transgender",
              icon: AppColor.transgender_sharp,
              isSelected: selectGender == 2,
              onTap: () => onGenderSelected(2)),
          _genderIcon(
              context: context,
              gender: "Bluetooth",
              icon: AppColor.bluetooth,
              isSelected: selectGender == 3,
              onTap: () => onGenderSelected(3))
        ],
      ),
    );
  }

  Widget _genderIcon({
    required BuildContext context,
    required String gender,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        IconButton(
          iconSize: 55,
          onPressed: onTap,
          icon: Icon(
            icon,
            color: isSelected ? AppColor.mainColor : AppColor.textColor,
          ),
        ),
        Text(
          gender,
          style: const TextStyle(fontSize: 17),
        )
      ],
    );
  }
}
