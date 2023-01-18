import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'First exo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 124, 134, 151)),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  int current = 1;
  int multiplicateur = 2;

  void getMultiple() {
    current = current * multiplicateur;
    notifyListeners();
  }

  void getDivivsion() {
    current = (current / multiplicateur).round();
    if (current == 0) {
      current = 1;
    }
    notifyListeners();
  }

  void setMultiple(int multiplicateur) {
    this.multiplicateur = multiplicateur;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    int pair = appState.current;
    var theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My First exo SCUB'),
          backgroundColor: theme.colorScheme.primary,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      appState.setMultiple(2);
                    },
                    child: const Text("coefficient 2")),
                const SizedBox(width: 5),
                ElevatedButton(
                    onPressed: () {
                      appState.setMultiple(3);
                    },
                    child: const Text("coefficient 3")),
                const SizedBox(width: 5),
                ElevatedButton(
                    onPressed: () {
                      appState.setMultiple(5);
                    },
                    child: const Text("coefficient 5")),
              ],
            ),
            BigCard(pair: pair),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      appState.getMultiple();
                    },
                    child: const Text("Multiplication")),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      appState.getDivivsion();
                    },
                    child: const Text("Division")),
              ],
            )
          ],
        )));
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final int pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
      backgroundColor: theme.colorScheme.secondary,
    );
    return Padding(
      padding: const EdgeInsets.all(122),
      child: Text(
        '$pair',
        style: style,
      ),
    );
  }
}
