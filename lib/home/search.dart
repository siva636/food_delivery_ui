import 'package:flutter/material.dart';

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
        contentPadding: EdgeInsets.only(top: 15, bottom: 5),
        icon: Transform.translate(
          offset: Offset(0, 5),
          child: Icon(Icons.search),
        ),
        labelText: 'Search..',
      ),
    );
  }
}
