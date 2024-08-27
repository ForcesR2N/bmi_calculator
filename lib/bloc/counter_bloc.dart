import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<UpdateHeight>((event, emit) {
      final currentState = state;
      if (currentState is CounterUpdated) {
        emit(CounterUpdated(
          height: event.height,
          weight: currentState.weight,
          selectedGender: currentState.selectedGender,
          bmi: currentState.bmi,
          bmiMessage: currentState.bmiMessage,
        ));
      } else {
        emit(CounterUpdated(
          height: event.height,
          weight: 0.0,
          selectedGender: 0,
        ));
      }
    });

    on<UpdateWeight>((event, emit) {
      final currentState = state;
      if (currentState is CounterUpdated) {
        emit(CounterUpdated(
          height: currentState.height,
          weight: event.weight,
          selectedGender: currentState.selectedGender,
          bmi: currentState.bmi,
          bmiMessage: currentState.bmiMessage,
        ));
      } else {
        emit(CounterUpdated(
          height: 0.0,
          weight: event.weight,
          selectedGender: 0,
        ));
      }
    });

    on<SelectGender>((event, emit) {
      final currentState = state;
      if (currentState is CounterUpdated) {
        emit(CounterUpdated(
          height: currentState.height,
          weight: currentState.weight,
          selectedGender: event.gender,
          bmi: currentState.bmi,
          bmiMessage: currentState.bmiMessage,
        ));
      } else {
        emit(CounterUpdated(
          height: 0.0,
          weight: 0.0,
          selectedGender: event.gender,
        ));
      }
    });

    on<CalculateBMI>((event, emit) {
      final currentState = state;
      if (currentState is CounterUpdated) {
        double bmi = currentState.weight / (currentState.height * currentState.height) * 10000;
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

        emit(CounterUpdated(
          height: currentState.height,
          weight: currentState.weight,
          selectedGender: currentState.selectedGender,
          bmi: bmi,
          bmiMessage: bmiMessage,
        ));
      }
    });
  }
}
