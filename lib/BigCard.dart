import 'package:flutter/material.dart';

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
    );
    return Padding(
        padding: const EdgeInsets.all(122),
        child: SizedBox(
            height: 80,
            //width: 300,
            child: Card(
              color: Colors.black,
              child: Text(
                '$pair',
                style: style,
                textDirection: TextDirection.rtl,
              ),
            )));
  }
}
