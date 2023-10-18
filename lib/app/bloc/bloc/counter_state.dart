
class CounterState {
  final int counterValue;

  CounterState({required this.counterValue});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
    );
  }
}

final class CounterInitial extends CounterState {
  CounterInitial() : super(counterValue: 0);
}

class CounterIncrementstate extends CounterState {
  CounterIncrementstate(int newvalue) : super(counterValue: newvalue);
}

class DecrementState extends CounterState {
  DecrementState(int newvalue) : super(counterValue: newvalue);
}
