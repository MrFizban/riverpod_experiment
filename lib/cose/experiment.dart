import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_experiment/main.dart';
import 'dart:developer' as developer;

class Coso extends StatefulHookConsumerWidget {
  const Coso({Key? key}) : super(key: key);

  @override
  _CosoState createState() => _CosoState();
}

class _CosoState extends ConsumerState<Coso> {
  @override
  Widget build(BuildContext context) {
    var counter = ref.watch(counterProvider2);
    return Text('questo: ${counter.toString()}');
  }
}
