import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomActiveIcon extends StatefulWidget {
  final String iconPath;

  const CustomActiveIcon({super.key, required this.iconPath});

  @override
  CustomActiveIconState createState() => CustomActiveIconState();
}

class CustomActiveIconState extends State<CustomActiveIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 40.0 + 30.0 * _animation.value,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: SvgPicture.asset(
              widget.iconPath,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        );
      },
    );
  }
}
