import 'package:flutter/material.dart';
import 'package:food_delivery_ui/animation.dart';
import 'package:food_delivery_ui/data.dart';
import '../details.dart';

class PopularList extends StatelessWidget {
  PopularList(this._controller, {Key? key}) : super(key: key);
  final AnimationController _controller;

  late final foodDeliveryAnimation = FoodDeliveryAnimation(_controller);

  final List items = Popular.items;
  final int n = Popular.items.length;
  final double t1 = 2 / 3;
  final double t2 = 1;
  late final double t = (t2 - t1) / n;

  PageRouteBuilder navToDetails(Popular popular) {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(milliseconds: 750),
      pageBuilder: (context, animation, secondaryAnimation) => Details(popular),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: Popular.items.map(
        (e) {
          final int index = items.indexOf(e);
          final double a1 = t1 + index * t;
          double a2 = t1 + (index + 1) * t;
          return SizedBox(
            height: 150,
            child: Stack(
              children: [
                ScaleTransition(
                  scale: foodDeliveryAnimation.scale(a1, a2),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, navToDetails(e)),
                    child: Card(
                      margin: EdgeInsets.only(bottom: 15),
                      elevation: 3,
                      shadowColor: Colors.grey.shade50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                              left: 15,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 10),
                                Text(' ${e.slogan}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              e.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Weight ${e.weight} g',
                                style: Theme.of(context).textTheme.caption),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Container(
                                child: Center(
                                  child: Icon(Icons.add),
                                ),
                                width: 80,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star, size: 10),
                                      Text('5.0'),
                                    ],
                                  ),
                                ),
                                width: 60,
                                height: 45,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, navToDetails(e)),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    alignment: Alignment(0.5, 0),
                    child: Hero(
                      tag: '${e.name}',
                      flightShuttleBuilder: (BuildContext flightContext,
                              Animation<double> animation,
                              HeroFlightDirection flightDirection,
                              BuildContext fromHeroContext,
                              BuildContext toHeroContext) =>
                          RotationTransition(
                              turns: Tween<double>(begin: 0.75, end: 1)
                                  .animate(animation),
                              child: toHeroContext.widget),
                      child: SlideTransition(
                        position: foodDeliveryAnimation.slide(2 / 3, 1),
                        child: RotationTransition(
                          turns: foodDeliveryAnimation.rotate(2 / 3, 1),
                          child: Image.asset(
                            'assets/images/${e.imageUrl}',
                            height: 140,
                            width: 140,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
