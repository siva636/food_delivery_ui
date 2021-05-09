import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Bg(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CustomAppBar(),
                const SizedBox(height: 10),
                Title(),
                const SizedBox(height: 10),
                Search(),
                const SizedBox(height: 25),
                CategoryList(),
                const SizedBox(height: 25),
                Expanded(child: PopularList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
          backgroundColor: Colors.yellow,
        ),
        Icon(
          Icons.short_text,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

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
          offset: Offset(0, -5),
          child: Text(
            'Delivery',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        // alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        isCollapsed: true,
        isDense: false,
        contentPadding: EdgeInsets.only(top: 15),
        icon: Transform.translate(
          offset: Offset(0, 5),
          child: Icon(Icons.search),
        ),
        labelText: 'Search..',
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Categories',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: Category.items
                .map(
                  (e) => Card(
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
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class PopularList extends StatelessWidget {
  const PopularList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Popular',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: Popular.items
                .map(
                  (e) => SizedBox(
                    height: 150,
                    child: Card(
                      elevation: 3,
                      shadowColor: Colors.grey.shade50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
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
                                    Icon(Icons.star,
                                        color: Colors.amber, size: 10),
                                    Text(' ${e.slogan}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  e.name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                'assets/images/${e.imageUrl}',
                                height: 140,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

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
