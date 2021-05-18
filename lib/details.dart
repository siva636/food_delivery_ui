import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data.dart';
import 'package:flutter/foundation.dart';

class Details extends StatelessWidget {
  Details(this.data, {Key? key}) : super(key: key);

  final Popular data;

  final TextStyle labelStyle = const TextStyle(
    fontSize: 15,
    color: Colors.grey,
  );
  final TextStyle infoStyle = const TextStyle(
    fontSize: 20,
  );

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
                CustomAppBar(),
                SizedBox(height: 15),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Text(
                    data.name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 15),
                RichText(
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
                        text: data.price.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 15),
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Size',
                            style: labelStyle,
                          ),
                          Text(
                            data.size,
                            style: infoStyle,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Crust',
                            style: labelStyle,
                          ),
                          Text(
                            data.crustOrHot,
                            style: infoStyle,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Delivery in',
                            style: labelStyle,
                          ),
                          Text(
                            '30 min',
                            style: infoStyle,
                          ),
                        ]),
                    Hero(
                      flightShuttleBuilder: (BuildContext flightContext,
                              Animation<double> animation,
                              HeroFlightDirection flightDirection,
                              BuildContext fromHeroContext,
                              BuildContext toHeroContext) =>
                          RotationTransition(
                              turns: Tween<double>(begin: -1, end: -0.75)
                                  .animate(animation),
                              child: toHeroContext.widget),
                      tag: '${data.name}',
                      child: Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Image.asset(
                          'assets/images/${data.imageUrl}',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 15),
                Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 75,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: data.ingredients
                        .map(
                          (url) => SizedBox(
                            width: 75,
                            child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  'assets/images/$url',
                                )),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Spacer(),
                Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () => Navigator.pop(context),
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
      Container(
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
      )
    ]);
  }
}
