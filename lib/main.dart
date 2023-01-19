import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class MyChangeNotifier extends ChangeNotifier {
  int current = 1;
  int multiplicateur = 2;

  final Color stylePressed = const Color.fromARGB(255, 235, 181, 99);
  final Color styleNotPressed = Color.fromARGB(255, 100, 193, 236);

  late Color buttonColor1 = stylePressed;
  late Color buttonColor2 = styleNotPressed;
  late Color buttonColor3 = styleNotPressed;

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

  void refrecheStyleButton(int coef) {
    if (coef == 2) {
      buttonColor1 = stylePressed;
      buttonColor2 = styleNotPressed;
      buttonColor3 = styleNotPressed;
    }
    if (coef == 3) {
      buttonColor1 = styleNotPressed;
      buttonColor2 = stylePressed;
      buttonColor3 = styleNotPressed;
    }
    if (coef == 5) {
      buttonColor1 = styleNotPressed;
      buttonColor2 = styleNotPressed;
      buttonColor3 = stylePressed;
    }
    notifyListeners();
  }

  Color getButtonColor(int coef) {
    if (coef == 2) return buttonColor1;
    if (coef == 3) return buttonColor2;
    return buttonColor3;
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
        body: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Buttonwidget(
                      appState: appState, coef: 2, text: "coefficient 2"),
                  const SizedBox(width: 5),
                  Buttonwidget(
                      appState: appState, coef: 3, text: "coefficient 3"),
                  const SizedBox(width: 5),
                  Buttonwidget(
                      appState: appState, coef: 5, text: "coefficient 5"),
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
          ))
        ]));
  }
}

class Buttonwidget extends StatelessWidget {
  const Buttonwidget({
    super.key,
    required this.appState,
    required this.coef,
    required this.text,
  });

  final MyChangeNotifier appState;
  final int coef;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: appState.getButtonColor(coef),
      child: InkWell(
          child: Container(
            width: 100,
            height: 30,
            alignment: Alignment.center,
            child: Text(text),
          ),
          onTap: () {
            appState.setMultiple(coef);
            appState.refrecheStyleButton(coef);
          }),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final int pair;

  @override
  build(context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!.copyWith(
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
