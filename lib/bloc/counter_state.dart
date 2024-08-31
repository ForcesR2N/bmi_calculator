sealed class CounterState {
  final double height;
  final double weight;
  final int selectedGender;

  CounterState({
    required this.height,
    required this.weight,
    required this.selectedGender,
  });

  CounterState copyWith({
    double? height,
    double? weight,
    int? selectedGender,
  }) {
    return CounterInitial(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      selectedGender: selectedGender ?? this.selectedGender,
    );
  }
}

final class CounterInitial extends CounterState {
  CounterInitial({required double height, required double weight, required int selectedGender})
      : super(height: height, weight: weight, selectedGender: selectedGender);
}

final class CounterBmiCalculated extends CounterState {
  final double bmi;
  final String bmiMessage;

  CounterBmiCalculated({
    required double height,
    required double weight,
    required int selectedGender,
    required this.bmi,
    required this.bmiMessage,
  }) : super(height: height, weight: weight, selectedGender: selectedGender);
}
