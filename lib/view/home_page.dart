import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Assuming 'flutter_app' is the project's pubspec.yaml name for correct package imports
import 'package:flutter_app/viewmodel/counter_viewmodel.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Get the CounterViewModel from the Provider
    final counterViewModel = Provider.of<CounterViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title), // Use title directly as it's a StatelessWidget
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              // Display the counter value from the CounterViewModel
              '${counterViewModel.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Call the incrementCounter method from the CounterViewModel
        onPressed: () => counterViewModel.incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
