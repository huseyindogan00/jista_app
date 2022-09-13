import 'package:flutter/material.dart';

class BottomNaviBar extends StatefulWidget {
  BottomNaviBar({Key? key}) : super(key: key);

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  @override
  Widget build(BuildContext context) {
    const String home = 'Anasayfa';
    const String cargoInfo = 'Kargo Bilgileri';

    return BottomNavigationBar(
      backgroundColor: Colors.amber,
      items: const [
        BottomNavigationBarItem(backgroundColor: Colors.white, icon: Icon(Icons.add), label: home, tooltip: 'ipucu'),
        BottomNavigationBarItem(
            backgroundColor: Colors.white, icon: Icon(Icons.add), label: cargoInfo, tooltip: 'ipucu'),
      ],
    );
  }
}
