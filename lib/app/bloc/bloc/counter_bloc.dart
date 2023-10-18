import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_new/app/bloc/bloc/counter_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_event.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>(counterIncrementEvent);
    on<CounterDecrementEvent>(counterDecrementEvent);
  }

  FutureOr<void> counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterIncrementstate(state.counterValue + 1));
  }

  FutureOr<void> counterDecrementEvent(
      CounterDecrementEvent event, Emitter<CounterState> emit) {
    emit(DecrementState(state.counterValue - 1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
