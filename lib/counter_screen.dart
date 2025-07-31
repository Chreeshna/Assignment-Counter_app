import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_state.dart';
import 'circular_button.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.value.toString(),
                  style: const TextStyle(fontSize: 128),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(
                  icon: Icons.remove,
                  onPressed: () => counterBloc.add(Decrement()),
                ),
                CircularButton(
                  icon: Icons.refresh,
                  onPressed: () => counterBloc.add(Reset()),
                ),
                CircularButton(
                  icon: Icons.add,
                  onPressed: () => counterBloc.add(Increment()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
