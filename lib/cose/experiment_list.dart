
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer' as developer;

import '../counters/simple_list.dart';

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
    final listB = ref.watch(internalListProvider);
    return ProviderScope(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () {
                var list = ref.read(internalListProvider);
                ref.read(internalListProvider).add(list.length + 1);
                developer.log('$list', name: 'CosoList');
                setState(() {});
              },
              child: const Text('Add')),
        ),
        // Consumer(builder: (context, ref, _) {
        //   var list = ref.watch(internalListProvider);
        //   developer.log('list: $list', name: 'Consumer');
        //   return Column(children: );
        // }),
        ...listB.map((e) => Text('$e')).toList()
      ],
    ));
  }
}
