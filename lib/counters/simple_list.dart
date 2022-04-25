import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer' as developer;

class SimpleList extends StateNotifier<List<int>> {
  SimpleList({required List<int> list}) : super(list);

  void addX(int num) {
    state = [...state, num];
  }

  List<int> get list => state;

  int get last {
    developer.log('last: ${state.last}', name: 'SimpleList');
    return state.last;
  }

  int get length {
    developer.log('len: ${state.length}', name: 'SimpleList');
    return state.length;
  }
}
