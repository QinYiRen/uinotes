import 'package:flutter/material.dart';

class NumberRollingWidget extends StatefulWidget {
  final int targetNumber;
  final Duration duration;

  const NumberRollingWidget({
    super.key,
    required this.targetNumber,
    required this.duration,
  });

  @override
  _NumberRollingWidgetState createState() => _NumberRollingWidgetState();
}

class _NumberRollingWidgetState extends State<NumberRollingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  int _currentValue = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation =
        IntTween(begin: 0, end: widget.targetNumber).animate(_controller)
          ..addListener(() {
            setState(() {
              _currentValue = _animation.value;
            });
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_currentValue',
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
    );
  }
}
