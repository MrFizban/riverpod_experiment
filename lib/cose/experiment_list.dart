import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_experiment/main.dart';
import 'dart:developer' as developer;

class CosoList extends StatefulHookConsumerWidget {
  const CosoList({Key? key}) : super(key: key);

  @override
  _CosoListState createState() => _CosoListState();
}

class _CosoListState extends ConsumerState<CosoList> {
  final internalListProvider = StateNotifierProvider<SimpleList, List<int>>(
      (_) => SimpleList(list: [1, 2, 3, 4, 5]));

  @override
  void initState() {
    ref.read(internalListProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var list = ref.watch(internalListProvider);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () {
                ref.read(internalListProvider.notifier).add(1);
                developer.log('${ref.read(internalListProvider.notifier).list}',
                    name: 'CosoList');
              },
              child: const Flexible(child: Text('Add'))),
        ),
        Flexible(
          child: ListView(
            children: list.map((e) => Flexible(child: Text('$e'))).toList(),
          ),
        ),
      ],
    );
  }
}

class SimpleList extends StateNotifier<List<int>> {
  SimpleList({required List<int> list}) : super(list);

  void add(int num) {
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
