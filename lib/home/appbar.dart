import 'package:flutter/material.dart';

import '../animation.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(this._controller, {Key? key}) : super(key: key);
  final AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScaleTransition(
          scale: FoodDeliveryAnimation(_controller).scale(0, 1 / 3),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ),
        ScaleTransition(
          scale: FoodDeliveryAnimation(_controller).scale(0, 1 / 3),
          child: Icon(
            Icons.short_text,
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
    );
  }
}
