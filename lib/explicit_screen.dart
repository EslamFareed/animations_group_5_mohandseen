import 'package:flutter/material.dart';

class ExplicitScreen extends StatefulWidget {
  const ExplicitScreen({super.key});

  @override
  State<ExplicitScreen> createState() => _ExplicitScreenState();
}

class _ExplicitScreenState extends State<ExplicitScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(controller);

    // sizeAnimation = Tween<double>(begin: 30, end: 50).animate(controller);

    sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 100), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 100, end: 50), weight: 2),
    ]).animate(controller);

    controller.addListener(() {
      setState(() {});
      print(colorAnimation.value);
      print(sizeAnimation.value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit"),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            if (controller.isCompleted) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          icon: Icon(
            Icons.favorite,
            size: sizeAnimation.value,
            color: colorAnimation.value,
          ),
        ),
        // child: AnimatedBuilder(
        //   animation: colorAnimation,
        //   builder: (context, child) {
        //     print(colorAnimation.value);
        //     return IconButton(
        //       onPressed: () {
        //         if (controller.isCompleted) {
        //           controller.reverse();
        //         } else {
        //           controller.forward();
        //         }
        //       },
        //       icon: Icon(
        //         Icons.favorite,
        //         size: 100,
        //         color: colorAnimation.value,
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
