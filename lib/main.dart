import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_experiment/counters/int_list.dart';
import 'dart:developer' as developer;

import 'counters/counter.dart';
import 'cose/experiment.dart';
import 'cose/experiment_list.dart';

// A Counter example implemented with riverpod

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

/// Providers are declared globally and specify how to create a state
final counterProvider = StateProvider((ref) => 0);
final counterProvider2 =
    StateNotifierProvider<Counter, int>((ref) => Counter());
final intListProvider =
    StateNotifierProvider<IntList, List<int>>((ref) => IntList());
final simpleListProvider = StateProvider<List<int>>((ref) => [1, 2, 3]);

final textProvider = StateProvider((ref) => 'Hello');

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef reference) {

    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   child: Consumer(
            //     builder: (context, ref, _) =>
            //         Text(ref.watch(textProvider.state).state.toString()),
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   // Consumer is a widget that allows you reading providers.
            //   child: Consumer(builder: (context, ref, _) {
            //     final count = ref.watch(counterProvider.state).state;
            //     return Text('$count');
            //   }),
            // ),
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   // Consumer is a widget that allows you reading providers.
            //   child: const Coso(),
            // ),
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   // Consumer is a widget that allows you reading providers.
            //   child: Consumer(builder: (context, ref, _) {
            //     final simpleList = reference.watch(intListProvider.notifier).list;
            //     return Column(
            //       children: simpleList.map((e) => Text('$e')).toList(),
            //     );
            //   }),
            // ),

            Container(
              padding: const EdgeInsets.all(20),
              // Consumer is a widget that allows you reading providers.
              child: const CosoList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () {
          reference.read(counterProvider.notifier).state++;
          reference.read(textProvider.state).state =
              'Hello ${reference.read(counterProvider.state).state}';
          reference.read(counterProvider2.notifier).increment();

          reference
              .read(intListProvider.notifier)
              .add(reference.read(counterProvider.state).state);

          reference
              .read(simpleListProvider.state)
              .state
              .add(reference.read(counterProvider.state).state);

          developer.log(
              'Counter: ${reference.read(counterProvider.state).state} : ${reference.read(counterProvider2.notifier).state} : ${reference.read(counterProvider2.notifier).numero}',
              name: 'Counter');
          developer.log(
              '${reference.read(intListProvider.notifier).length}  ${reference.read(simpleListProvider.state).state.length}',
              name: 'CounterList');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
