import 'package:flutter/material.dart';

class FoodDeliveryTitle extends StatelessWidget {
  const FoodDeliveryTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Food',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
        Transform.translate(
          offset: Offset(-1, -6),
          child: Text(
            'Delivery',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
