import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/viewmodel/counter_viewmodel.dart'; // Ensure this is a package import
import 'package:flutter_app/view/home_page.dart'; // Import the new home_page.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'), // This remains the same
      ),
    );
  }
}
