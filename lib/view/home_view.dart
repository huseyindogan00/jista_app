import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:jista/global/global_variable.dart';
import 'package:jista/view/components/appbar.dart';
import 'package:jista/view/components/categories_fab.dart';
import 'package:jista/view/widget/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    initializationAnimate();
    super.initState();
  }

  // FAB da kullanılan bubble paketi için gerekli animasyon sınıfları başlatılıyor
  //love u
  // bende seni LOVE U

  initializationAnimate() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    final curverAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween<double>(begin: 0, end: 1).animate(curverAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // BURAYA SHOW DİALOG KOYULACAK. PROGRAMDAN TAMAMEN ÇIKIP ÇIKMAMAYI KONTROL EDECEĞİZ
        return false;
      },
      child: Scaffold(
        appBar: appbar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: categoriesFAB(animation, animationController),
        drawer: const NavigationDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // image eklemede hata var
              /* Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/categories/egitim_kiyafeti.jpg')),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                    
              ), */
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                color: Colors.cyan,
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                color: Colors.cyan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
