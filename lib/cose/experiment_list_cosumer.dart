
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_experiment/main.dart';
import 'dart:developer' as developer;

class TodoListView extends HookConsumerWidget {
  TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(internalListProviderTodo);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(15),
            child: Text(ref.watch(textProvider))),
        Container(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
              onPressed: () {
                var list = ref.read(internalListProviderTodo);
                ref.read(internalListProviderTodo.notifier).addX(list.length + 1);
                ref.read(textProvider.state).state = "Ciao";
                developer.log('$list', name: 'CosoList');
              },
              child: const Text('Add')),
        ),
        ...list.map((e) => Text('$e')).toList(),
      ],
    );
  }
}
