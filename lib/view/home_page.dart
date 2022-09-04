import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:jista/view/navigation_drawer_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        actions: [
          Badge(
            animationType: BadgeAnimationType.fade,
            badgeContent: const Text('5'),
            child: (GestureDetector(
              child: const Icon(Icons.add_shopping_cart_sharp),
              onTap: () {
                // Cart iconuna tıklandığında carta ekleme yapar
              },
            )),
          ),
          const SizedBox(width: 15)
        ],
      ),
    );
  }
}
