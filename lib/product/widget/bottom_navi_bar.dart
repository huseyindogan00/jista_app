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
    const String cargoInfo = 'Kargo Bilgilerim';
    const String sizeInfo = 'Ölçü Bilgilerim';
    int selectedIndex = 0;

    return BottomNavigationBar(
      backgroundColor: Colors.blue.shade400,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      unselectedIconTheme: const IconThemeData(color: Colors.white, size: 24),
      selectedIconTheme: const IconThemeData(color: Colors.red, size: 32),
      iconSize: 32,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined),
            label: cargoInfo,
            tooltip: 'ipucu'),
        BottomNavigationBarItem(
            icon: Icon(Icons.square_foot_outlined),
            label: sizeInfo,
            tooltip: 'ipucu'),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: home,
            tooltip: 'Anasayfa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.square_foot_outlined),
            label: sizeInfo,
            tooltip: 'ipucu'),
      ],
    );
  }
}
