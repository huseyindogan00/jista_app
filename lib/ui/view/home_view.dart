import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:jista/data/constant/assets_file.dart';
import 'package:jista/data/constant/font_size.dart';
import 'package:jista/global/global_variable.dart';
import 'package:jista/ui/components/appbar.dart';
import 'package:jista/ui/components/categories_fab.dart';
import 'package:jista/ui/widget/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    initializationAnimate();
    super.initState();
  }

  // FAB da kullanılan bubble paketi için gerekli animasyon sınıfları başlatılıyor
  initializationAnimate() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    final curverAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween<double>(begin: 0, end: 1).animate(curverAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //PROGRAMDAN TAMAMEN ÇIKIP ÇIKMAMAYI KONTROL EDİLİYOR
      onWillPop: () async {
        if (animationController.isCompleted) {
          animationController.reverse();
          return false;
        } else {
          final result = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Çıkmak istediğinizden emin misiniz?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.maybePop(context, true);
                      },
                      child: const Text('Evet')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('Geri'))
                ],
              );
            },
          );
          return result;
        }
      },
      child: Scaffold(
        appBar: appbar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: categoriesFAB(animation, animationController),
        drawer: const NavigationDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.white, icon: Icon(Icons.add), label: 'Ekle', tooltip: 'ipucu'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Sil'),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategory(context, AssetsImages.serviceWear, 'Hizmet Kıyafeti'),
              _buildCategory(context, AssetsImages.trainingClothing, 'Eğitim Kıyafeti'),
              _buildCategory(context, AssetsImages.stafTaskClothing, 'Kadro Görev Kıyafeti'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, AssetImage assetsImages, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(blurRadius: 1, color: Colors.cyan, spreadRadius: 2),
          ],
          image: DecorationImage(image: assetsImages, fit: BoxFit.fill),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 112, 115, 111).withOpacity(0.6),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          width: double.infinity,
          height: 75,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
