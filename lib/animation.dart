import 'package:flutter/material.dart';

class FoodDeliveryAnimation {
  const FoodDeliveryAnimation(this._controller);
  final AnimationController _controller;

  Animation<double> scale(double t1, double t2) {
    assert(t1 < t2 && t1 >= 0 && t2 <= 1);
    return Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          t1,
          t2,
          curve: Curves.ease,
        ),
      ),
    );
  }

  Animation<Offset> slide(double t1, double t2) {
    assert(t1 < t2 && t1 >= 0 && t2 <= 1);
    return Tween<Offset>(
      begin: Offset(4, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          t1,
          t2,
          curve: Curves.ease,
        ),
      ),
    );
  }

  Animation<double> rotate(double t1, double t2) {
    assert(t1 < t2 && t1 >= 0 && t2 <= 1);
    return Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          t1,
          t2,
          curve: Curves.ease,
        ),
      ),
    );
  }
}
