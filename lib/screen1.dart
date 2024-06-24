import 'package:animations_group_5_mohandseen/screen2.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, _buildRoute());
          },
          child: const Text("Go to"),
        ),
      ),
    );
  }
}

Route _buildRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(seconds: 3),
    pageBuilder: (context, animation, secondaryAnimation) => const Screen2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0, 1);
      var end = const Offset(0, 0);
      var tween = Tween(begin: begin, end: end);
      return SlideTransition(
        position: animation.drive(tween),
        child: FadeTransition(
          opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
          child: child,
        ),
      );

      // return FadeTransition(
      //   opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
      //   child: child,
      // );

      // return SizeTransition(
      //   sizeFactor: animation.drive(Tween(begin: 0.0, end: 1.0)),
      //   child: child,
      // );

      // return AlignTransition(alignment: alignment, child: child)
    },
  );
}
