import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(height: 0.0, weight: 0.0, selectedGender: 0)) {
    on<GenderSelectedEvent>((event, emit) {
      emit(state.copyWith(selectedGender: event.gender));
    });

    on<HeightChangedEvent>((event, emit) {
      emit(state.copyWith(height: event.height));
    });

    on<WeightChangedEvent>((event, emit) {
      emit(state.copyWith(weight: event.weight));
    });

    on<CalculateBmiEvent>((event, emit) {
      final height = state.height;
      final weight = state.weight;

      if (height > 0 && weight > 0) {
        final bmi = weight / (height * height) * 10000;
        String bmiMessage;

        if (bmi < 18.5) {
          bmiMessage = "Underweight";
        } else if (bmi < 24.9) {
          bmiMessage = "Normal";
        } else if (bmi < 29.9) {
          bmiMessage = "Overweight";
        } else {
          bmiMessage = "Obesity";
        }

        emit(CounterBmiCalculated(
          height: height,
          weight: weight,
          selectedGender: state.selectedGender,
          bmi: bmi,
          bmiMessage: bmiMessage,
        ));
      }
    });
  }
}
