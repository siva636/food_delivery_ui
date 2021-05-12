import 'package:flutter/material.dart';

class Bg extends StatelessWidget {
  const Bg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: BgClipper(),
      child: Container(
        color: Colors.grey.shade100,
      ),
    );
  }
}

class BgClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    double column = size.width / 4;
    double row = size.height / 8;

    Rect rect = Rect.fromCenter(
      center: Offset(0, row),
      width: 6 * column,
      height: row * 4,
    );
    return rect;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
