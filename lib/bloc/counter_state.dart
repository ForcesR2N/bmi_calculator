part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterUpdated extends CounterState {
  final double height;
  final double weight;
  final int selectedGender;
  final double? bmi;
  final String? bmiMessage;

  CounterUpdated({
    required this.height,
    required this.weight,
    required this.selectedGender,
    this.bmi,
    this.bmiMessage,
  });
}
