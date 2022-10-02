// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/data/theme/theme_app.dart';
import 'package:jista/product/models/person/person_model.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key, required this.imagePath, required this.personModel}) : super(key: key);
  String imagePath;
  PersonModel personModel;

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context, imagePath, personModel),
              buildMenuItem(context),
            ],
          ),
        ),
      );
}

Widget buildHeader(BuildContext context, String imagePath, PersonModel personModel) {
  return Container(
    color: Theme.of(context).primaryColor.withOpacity(0.8),
    padding: EdgeInsets.only(
      top: 24 + MediaQuery.of(context).padding.top,
      bottom: 24,
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 12),
        Text(
          '${personModel.name} ${personModel.lastName}',
          style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          '${personModel.rank}',
          style: const TextStyle(fontSize: 16, color: Colors.white, fontStyle: FontStyle.italic),
        ),
        Text(
          '${personModel.duty}',
          style: const TextStyle(fontSize: 16, color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    ),
  );
}

Widget buildMenuItem(BuildContext context) {
  TextStyle textStyle = const TextStyle(fontSize: 16);
  ThemeApp theme = Get.put(ThemeApp());
  return Container(
    padding: const EdgeInsets.all(20),
    child: Wrap(
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: Text(
            'Anasayfa',
            style: textStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.align_horizontal_left_outlined),
          title: Text(
            'Kategoriler',
            style: textStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.square_foot_outlined),
          title: Text(
            'Ölçü Bilgileri',
            style: textStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.local_shipping_outlined),
          title: Text(
            'Kargo Adresim',
            style: textStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.supervised_user_circle),
          title: Text(
            'Mutemet İşlemlerim',
            style: textStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month_outlined),
          title: Text(
            'İstihkak İstek Dönemi',
            style: textStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.boy_outlined),
          title: Text(
            'Beden Ölçüleri Tespit Broşürü',
            style: textStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.plagiarism),
          title: Text(
            'İstihkak Kargo İhalesi Fiyat Cetveli',
            style: textStyle,
          ),
          onTap: () {},
        ),
        selectThemeMode(theme)
      ],
    ),
  );
}

Row selectThemeMode(ThemeApp theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const Text('Koyu Tema'),
      Obx(
        () => Switch(
          value: theme.isDarkModeApp.value,
          onChanged: (value) {
            theme.isDarkModeApp.value = value;
            if (value) {
              Get.changeThemeMode(ThemeMode.dark);
              Get.back();
            } else {
              Get.changeThemeMode(ThemeMode.light);
              Get.back();
            }
          },
        ),
      ),
    ],
  );
}
