abstract class CounterEvent {}

class GenderSelectedEvent extends CounterEvent {
  final int gender;

  GenderSelectedEvent(this.gender);
}

class HeightChangedEvent extends CounterEvent {
  final double height;

  HeightChangedEvent(this.height);
}

class WeightChangedEvent extends CounterEvent {
  final double weight;

  WeightChangedEvent(this.weight);
}

class CalculateBmiEvent extends CounterEvent {}
