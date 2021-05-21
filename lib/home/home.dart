import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_ui/animation.dart';
import 'package:food_delivery_ui/home/bg.dart';
import 'package:food_delivery_ui/home/categories.dart';
import 'package:food_delivery_ui/home/popular.dart';
import 'package:food_delivery_ui/home/search.dart';
import 'package:food_delivery_ui/home/title.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final foodDeliveryAnimation = FoodDeliveryAnimation(_controller);

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: kIsWeb ? 500 : double.infinity,
          ),
          child: Stack(
            children: [
              ScaleTransition(
                  scale: foodDeliveryAnimation.scale(0, 1 / 3),
                  alignment: Alignment.topLeft,
                  child: Bg()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kIsWeb ? 5 : 50,
                    ),
                    // app bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ScaleTransition(
                          scale: foodDeliveryAnimation.scale(0, 1 / 3),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar.jpg'),
                          ),
                        ),
                        ScaleTransition(
                          scale: foodDeliveryAnimation.scale(0, 1 / 3),
                          child: Icon(
                            Icons.short_text,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ScaleTransition(
                      scale: foodDeliveryAnimation.scale(0, 1 / 3),
                      alignment: Alignment.centerLeft,
                      child: FoodDeliveryTitle(),
                    ),
                    const SizedBox(height: 10),
                    ScaleTransition(
                      scale: foodDeliveryAnimation.scale(0, 1 / 3),
                      alignment: Alignment.centerLeft,
                      child: Search(),
                    ),
                    const SizedBox(height: 25),
                    ScaleTransition(
                      scale: foodDeliveryAnimation.scale(0, 1 / 3),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Categories',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    CategoryList(_controller),
                    const SizedBox(height: 25),
                    ScaleTransition(
                      scale: foodDeliveryAnimation.scale(2 / 3, 2 / 3 + .1),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Popular',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: PopularList(_controller),
                    ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
