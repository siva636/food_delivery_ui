import 'package:flutter/material.dart';
import 'package:food_delivery_ui/animation.dart';
import 'package:food_delivery_ui/data.dart';
import 'package:flutter/foundation.dart';

class Details extends StatefulWidget {
  Details(this.data, {Key? key}) : super(key: key);

  final Popular data;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int animationDuration = 1;
  double scaleAnimationInterval = 3 / 4;
  double initialStaggeredAnimationDelay = 1 / 4;
  late double staggeredAnimationInterval =
      (1 - initialStaggeredAnimationDelay) / 6;
  double initialOffset = -0.5;

  final TextStyle labelStyle = const TextStyle(
    fontSize: 15,
    color: Colors.grey,
  );

  final TextStyle infoStyle = const TextStyle(
    fontSize: 20,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationDuration),
    )..forward();
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
          child: Padding(
            padding: EdgeInsets.only(
              top: kIsWeb ? 5 : 50,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(controller: _controller),
                SizedBox(height: 15),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: ScaleTransition(
                    scale: FoodDeliveryAnimation(_controller).scale(0, 0.5),
                    child: Text(
                      widget.data.name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ScaleTransition(
                  scale: FoodDeliveryAnimation(_controller).scale(0, 0.5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Transform.translate(
                            offset: Offset(-2, -9),
                            child: Text('\$',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.red)),
                          ),
                        ),
                        TextSpan(
                          text: widget.data.price.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 15),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SlideTransition(
                          position: FoodDeliveryAnimation(_controller).slide(
                              initialStaggeredAnimationDelay,
                              initialStaggeredAnimationDelay +
                                  staggeredAnimationInterval,
                              beginOffsetX: initialOffset),
                          child: Text(
                            'Size',
                            style: labelStyle,
                          ),
                        ),
                        SlideTransition(
                          position: FoodDeliveryAnimation(_controller).slide(
                              initialStaggeredAnimationDelay +
                                  staggeredAnimationInterval,
                              initialStaggeredAnimationDelay +
                                  2 * staggeredAnimationInterval,
                              beginOffsetX: initialOffset),
                          child: Text(
                            widget.data.size,
                            style: infoStyle,
                          ),
                        ),
                        SizedBox(height: 15),
                        SlideTransition(
                          position: FoodDeliveryAnimation(_controller).slide(
                              initialStaggeredAnimationDelay +
                                  2 * staggeredAnimationInterval,
                              initialStaggeredAnimationDelay +
                                  3 * staggeredAnimationInterval,
                              beginOffsetX: initialOffset),
                          child: Text(
                            'Crust',
                            style: labelStyle,
                          ),
                        ),
                        SlideTransition(
                          position: FoodDeliveryAnimation(_controller).slide(
                              initialStaggeredAnimationDelay +
                                  3 * staggeredAnimationInterval,
                              initialStaggeredAnimationDelay +
                                  4 * staggeredAnimationInterval,
                              beginOffsetX: initialOffset),
                          child: Text(
                            widget.data.crustOrHot,
                            style: infoStyle,
                          ),
                        ),
                        SizedBox(height: 15),
                        SlideTransition(
                          position: FoodDeliveryAnimation(_controller).slide(
                              initialStaggeredAnimationDelay +
                                  4 * staggeredAnimationInterval,
                              initialStaggeredAnimationDelay +
                                  5 * staggeredAnimationInterval,
                              beginOffsetX: initialOffset),
                          child: Text(
                            'Delivery in',
                            style: labelStyle,
                          ),
                        ),
                        SlideTransition(
                          position: FoodDeliveryAnimation(_controller).slide(
                              initialStaggeredAnimationDelay +
                                  5 * staggeredAnimationInterval,
                              initialStaggeredAnimationDelay +
                                  6 * staggeredAnimationInterval,
                              beginOffsetX: initialOffset),
                          child: Text(
                            '30 min',
                            style: infoStyle,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Hero(
                        flightShuttleBuilder: (BuildContext flightContext,
                                Animation<double> animation,
                                HeroFlightDirection flightDirection,
                                BuildContext fromHeroContext,
                                BuildContext toHeroContext) =>
                            RotationTransition(
                                turns: Tween<double>(begin: 0.5, end: 1)
                                    .animate(animation),
                                child: toHeroContext.widget),
                        tag: '${widget.data.name}',
                        child: Image.asset(
                          'assets/images/${widget.data.imageUrl}',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 15),
                ScaleTransition(
                  scale: FoodDeliveryAnimation(_controller).scale(0, 0.5),
                  child: Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 75,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: widget.data.ingredients
                        .map(
                          (url) => SizedBox(
                            width: 75,
                            child: ScaleTransition(
                              scale: FoodDeliveryAnimation(_controller)
                                  .scale(0, 0.5),
                              child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    'assets/images/$url',
                                  )),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Spacer(),
                SlideTransition(
                  position: FoodDeliveryAnimation(_controller)
                      .slide(0, 0.5, beginOffsetX: 0, beginOffsetY: 2),
                  child: Container(
                    // width: MediaQuery.of(context).size.shortestSide * .7,
                    height: 75,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Place an Order'),
                          Icon(Icons.navigate_next),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.controller}) : super(key: key);
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: ScaleTransition(
            scale: FoodDeliveryAnimation(controller).scale(0, 0.75),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                // color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2.0,
                  color: Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.navigate_before,
                  // color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        ScaleTransition(
          scale: FoodDeliveryAnimation(controller).scale(0, 0.75),
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Icons.star,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
