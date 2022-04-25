import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntList extends StateNotifier<List<int>> {
  IntList() : super([9, 8, 7, 6, 5, 4, 3, 2, 1]);

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
