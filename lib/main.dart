import 'package:exo1/BigCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Buttonwidget.dart';
import 'MyChangeNotifier.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(_) {
    return ChangeNotifierProvider(
      create: (_) => MyChangeNotifier(),
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  build(context) {
    final appState = context.watch<MyChangeNotifier>();
    late int pair = appState.current;
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My First exo SCUB'),
          backgroundColor: theme.colorScheme.primary,
        ),
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
              child: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Buttonwidget(
                        appState: appState, coef: 2, text: "coefficient 2"),
                  ),
                  const SizedBox(width: 50),
                  Flexible(
                    child: Buttonwidget(
                        appState: appState, coef: 3, text: "coefficient 3"),
                  ),
                  const SizedBox(width: 50),
                  Flexible(
                    child: Buttonwidget(
                        appState: appState, coef: 5, text: "coefficient 5"),
                  )
                ],
              ),
              BigCard(pair: pair),
              //const SizedBox(height: 10),
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
          ))
        ]));
  }
}
