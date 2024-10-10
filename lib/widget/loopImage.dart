import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uinotes/common/res.dart';

class LoopImageColumn extends StatelessWidget {
  const LoopImageColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoopImage(animationOffset: 0),
        SizedBox(height: 16),
        LoopImage(animationOffset: 1),
        SizedBox(height: 16),
        LoopImage(animationOffset: 2),
      ],
    );
  }
}

class LoopImage extends StatefulWidget {
  final double animationOffset;

  const LoopImage({required this.animationOffset});

  @override
  _LoopImageState createState() => _LoopImageState();
}

class _LoopImageState extends State<LoopImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 120),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
    _controller.repeat();
  }

  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        late double offset;
        if (widget.animationOffset == 0) {
          offset =-_controller.value * 1734;
        }
        if (widget.animationOffset == 1) {
          offset = -1734 + _controller.value * 1734;
        }
        if (widget.animationOffset == 2) {
          offset = -65-_controller.value * 1734;
        }
        return Transform.translate(
          offset: Offset(offset, 0.0),
          child: SvgPicture.asset(
            R.icons.icons,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
