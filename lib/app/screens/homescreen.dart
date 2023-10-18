import 'package:bloc_new/app/bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/counter_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 131, 108, 106),
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is CounterIncrementstate) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incrementing..')));
              } else if (state is DecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Decrementing..')));
              }
            },
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  'Counter value ${state.counterValue}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterDecrementEvent()),
                child: const Text("Decrease"),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterIncrementEvent()),
                child: const Text("Increase"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
