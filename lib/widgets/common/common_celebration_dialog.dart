import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CommonCelebrationDialog extends StatefulWidget {
  final Widget child;
  final bool barrierDismissible;

  const CommonCelebrationDialog({
    super.key,
    required this.child,
    this.barrierDismissible = false,
  });

  static Future<void> show(
      BuildContext context, {
        required Widget child,
        bool barrierDismissible = true,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => CommonCelebrationDialog(
        child: child,
        barrierDismissible: barrierDismissible,
      ),
    );
  }

  @override
  State<CommonCelebrationDialog> createState() =>
      _CommonCelebrationDialogState();
}

class _CommonCelebrationDialogState
    extends State<CommonCelebrationDialog> {
  late ConfettiController leftController;
  late ConfettiController rightController;
  late ConfettiController centerController;

  @override
  void initState() {
    super.initState();

    leftController = ConfettiController(
      duration: const Duration(minutes: 30),
    );

    rightController = ConfettiController(
      duration: const Duration(minutes: 30),
    );

    centerController = ConfettiController(
      duration: const Duration(minutes: 30),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      leftController.play();
      rightController.play();
      centerController.play();

      Future.delayed(Duration(seconds: 5), () {
        if (mounted && Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void dispose() {
    leftController.stop();
    rightController.stop();
    centerController.stop();

    leftController.dispose();
    rightController.dispose();
    centerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.barrierDismissible,
      child: Material(
        color: Colors.black54,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: ConfettiWidget(
                confettiController: leftController,
                blastDirection: pi / 4,
                emissionFrequency: 0.05,
                numberOfParticles: 15,
                gravity: 0.15,
                shouldLoop: true,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ConfettiWidget(
                confettiController: rightController,
                blastDirection: 3 * pi / 4,
                emissionFrequency: 0.05,
                numberOfParticles: 15,
                gravity: 0.15,
                shouldLoop: true,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: centerController,
                blastDirectionality:
                BlastDirectionality.explosive,
                emissionFrequency: 0.08,
                numberOfParticles: 25,
                gravity: 0.20,
                shouldLoop: true,
              ),
            ),
            Center(
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 700),
                curve: Curves.elasticOut,
                tween: Tween(begin: 0.5, end: 1),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}