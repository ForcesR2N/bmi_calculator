part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class UpdateHeight extends CounterEvent {
  final double height;
  UpdateHeight(this.height);
}

class UpdateWeight extends CounterEvent {
  final double weight;
  UpdateWeight(this.weight);
}

class SelectGender extends CounterEvent {
  final int gender;
  SelectGender(this.gender);
}

class CalculateBMI extends CounterEvent {}
