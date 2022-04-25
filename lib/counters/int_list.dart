import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntList extends StateNotifier<List<int>> {
  IntList() : super([]);

  void add(int num) {
    state = [...state, num];
  }

  void remove(int num) {
    state.remove(num);
    state = [...state];
  }

  @override
  String toString() {
    return 'questo: ${state.toString()}';
  }

  int get length => state.length;

  List<int> get list => state;
}
