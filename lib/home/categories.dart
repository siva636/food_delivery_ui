import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data.dart';
import 'package:food_delivery_ui/animation.dart';

class CategoryList extends StatelessWidget {
  CategoryList(this._controller, {Key? key}) : super(key: key);
  final AnimationController _controller;

  late final foodDeliveryAnimation = FoodDeliveryAnimation(_controller);

  final List items = Category.items;
  final int n = Category.items.length;
  final double t1 = 1 / 3;
  final double t2 = 2 / 3;
  late final double t = (t2 - t1) / n;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: Category.items.map(
          (e) {
            final int index = items.indexOf(e);
            final double a1 = t1 + index * t;
            double a2 = t1 + (index + 1) * t;
            return ScaleTransition(
              scale: foodDeliveryAnimation.scale(a1, a2),
              child: GestureDetector(
                onTap: () => ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Tap a popular item to view details screen'),
                          ]),
                    ),
                  ),
                child: Card(
                  elevation: 3,
                  shadowColor: Colors.grey.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.only(right: 15, bottom: 3),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/${e.imageUrl}',
                          height: 50,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                        Text(e.name),
                        Icon(Icons.play_circle_fill,
                            color: Colors.deepOrangeAccent),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
