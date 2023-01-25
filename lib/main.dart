import 'package:exo1/BigCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'InkwellWidget.dart';
import 'ModelOfHomepage.dart';
import 'MyChangeNotifier.dart';

MyChangeNotifier myChangeNotifier = MyChangeNotifier(
  ModelOfHomepage(
      buttonColor1: MyChangeNotifier.stylePressed,
      buttonColor2: MyChangeNotifier.styleNotPressed,
      buttonColor3: MyChangeNotifier.styleNotPressed,
      current: 1,
      multiplicateur: 2),
);

final myChangeNotifierProvider =
    StateNotifierProvider<MyChangeNotifier, ModelOfHomepage>(
        (_) => myChangeNotifier);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      title: 'First exo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 124, 134, 151)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  build(context, ref) {
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
          MyDynamiqueWidget(refForListener: ref)
        ]));
  }
}

class MyDynamiqueWidget extends StatelessWidget {
  const MyDynamiqueWidget({required this.refForListener, super.key});

  final WidgetRef refForListener;

  @override
  Widget build(BuildContext context) {
    final appWatch = refForListener.watch(myChangeNotifierProvider);
    final appReadd = refForListener.read(myChangeNotifierProvider.notifier);
    return Center(
        child: ListView(
      children: [
        const SizedBox(height: 50),
        TopButtonWidget(appReadd: appReadd),
        BigCard(pair: appWatch.current),
        DownButtonWidget(appReadd: appReadd, appWatch: appWatch)
      ],
    ));
  }
}

class DownButtonWidget extends StatelessWidget {
  const DownButtonWidget({
    super.key,
    required this.appReadd,
    required this.appWatch,
  });

  final MyChangeNotifier appReadd;
  final ModelOfHomepage appWatch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: ElevatedButton(
                onPressed: () {
                  appReadd.getMultiple(
                      appWatch.current, appWatch.multiplicateur);
                },
                child: const Text("Multiplication"))),
        const SizedBox(width: 10),
        Flexible(
            child: ElevatedButton(
                onPressed: () {
                  appReadd.getDivivsion(
                      appWatch.current, appWatch.multiplicateur);
                },
                child: const Text("Division"))),
      ],
    );
  }
}

class TopButtonWidget extends StatelessWidget {
  const TopButtonWidget({
    super.key,
    required this.appReadd,
  });

  final MyChangeNotifier appReadd;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child:
              InkWellWidget(appState: appReadd, coef: 2, text: "coefficient 2"),
        ),
        const SizedBox(width: 50),
        Flexible(
          child:
              InkWellWidget(appState: appReadd, coef: 3, text: "coefficient 3"),
        ),
        const SizedBox(width: 50),
        Flexible(
          child:
              InkWellWidget(appState: appReadd, coef: 5, text: "coefficient 5"),
        )
      ],
    );
  }
}
