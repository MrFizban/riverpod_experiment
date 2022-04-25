import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  int numero = 0;

  Counter() : super(0);

  void increment() {
    state++;
    numero++;
  }

  void decrement() {
    state--;
    numero--;
  }

  @override
  String toString() {
    return 'questo: $state.toString()';
  }
}
