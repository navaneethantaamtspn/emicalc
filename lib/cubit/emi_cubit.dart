import 'dart:math';

import 'package:bloc/bloc.dart';

part 'emi_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment(
      {required String a,
      required String b,
      required String c,
      required String d}) {
    double A = 0.0;
    int P = int.parse(a);
    double r = int.parse(b) / 12 / 100;
    int n = d == "Year(s)" ? int.parse(c) * 12 : int.parse(c);
    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
//TODO: Limit the Result with two Decimal Places
    return emit(CounterState(counterValue: A));
  }
}
