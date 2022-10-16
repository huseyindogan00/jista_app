// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/data/constant/style/const_button_style.dart';
import 'package:jista/data/theme/theme_app.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/views/base/base_model.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({
    Key? key,
    required this.imagePath,
    required this.personModel,
  }) : super(key: key) {
    initializer();
  }

  BaseModel? controller;
  final ThemeApp theme = Get.put(ThemeApp());
  String imagePath;
  PersonModel personModel;

  void initializer() {
    controller = Get.put(BaseModel());
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context, imagePath, personModel),
            buildMenuItem(context),
          ],
        ),
      );

  Widget buildHeader(BuildContext context, String imagePath, PersonModel personModel) {
    Color textColor = const Color.fromARGB(255, 230, 230, 236);
    return Container(
      color: Get.theme.backgroundColor.withOpacity(0.9),
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
            style: TextStyle(fontSize: 28, color: textColor, fontWeight: FontWeight.bold),
          ),
          Text(
            '${personModel.rank}',
            style: TextStyle(fontSize: 16, color: textColor, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
          Text(
            '${personModel.duty}',
            style: TextStyle(fontSize: 16, color: textColor, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context) {
    TextStyle? textStyle = Get.theme.textTheme.headline6;
    double iconSize = 38;
    return Expanded(
      child: Container(
        color: Get.theme.backgroundColor.withOpacity(0.3),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Icon(Icons.supervised_user_circle, size: iconSize),
              title: Text(
                'Mutemet İşlemlerim',
                style: textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.boy_outlined, size: iconSize),
              title: Text(
                'Beden Ölçüleri Tespit Broşürü',
                style: textStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.plagiarism, size: iconSize),
              title: Text('İstihkak Kargo İhalesi Fiyat Cetveli', style: textStyle),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            selectThemeMode(theme),
            const Divider(height: 11, color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      width: 190,
                      child: ElevatedButton(
                        onPressed: () {
                          HiveService().deleteUserBox('personBox');
                          context.router.replace(EntryRoute());
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: const Text('Oturumu Kapat', textAlign: TextAlign.end),
                      ),
                    ),
                    const Positioned(left: 10, child: Icon(Icons.exit_to_app)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

// THEME DEĞİŞTİĞİNDE
  Row selectThemeMode(ThemeApp theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Koyu Tema', style: Get.theme.textTheme.headline6),
        Obx(
          () => Switch(
            value: theme.isDarkModeApp.value,
            onChanged: (value) {
              theme.isDarkModeApp.value = value;
              if (value) {
                Get.changeThemeMode(ThemeMode.dark);
              } else {
                Get.changeThemeMode(ThemeMode.light);
              }
              Get.back();
            },
          ),
        ),
      ],
    );
  }
}
