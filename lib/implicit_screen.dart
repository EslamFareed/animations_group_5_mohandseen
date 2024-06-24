import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitScreen extends StatefulWidget {
  const ImplicitScreen({super.key});

  @override
  State<ImplicitScreen> createState() => _ImplicitScreenState();
}

class _ImplicitScreenState extends State<ImplicitScreen> {
  double size = 100;
  Color color = Colors.black;
  bool first = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            width: size,
            height: size,
            color: color,
          ),
          AnimatedCrossFade(
            firstChild: Text(
              "Hello first",
              style: TextStyle(fontSize: 50),
            ),
            secondChild: Text(
              "Hello Second",
              style: TextStyle(fontSize: 50),
            ),
            crossFadeState:
                first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(seconds: 1),
          ),
          ElevatedButton(
            onPressed: () {
              // size = Random().nextDouble() * 200;
              if (color == Colors.black) {
                color = Colors.red;
              } else {
                color = Colors.black;
              }
              first = !first;
              setState(() {});
            },
            child: const Text("Change"),
          )
        ],
      ),
    );
  }
}
