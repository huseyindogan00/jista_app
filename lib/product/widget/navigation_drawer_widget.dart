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

  Widget buildHeader(
      BuildContext context, String imagePath, PersonModel personModel) {
    return Container(
      color: Get.theme.primaryColor.withOpacity(0.9),
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
            style: const TextStyle(
                fontSize: 28,
                color: Color.fromARGB(255, 66, 68, 230),
                fontWeight: FontWeight.bold),
          ),
          Text(
            '${personModel.rank}',
            style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 87, 103, 136),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '${personModel.duty}',
            style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 163, 115, 12),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context) {
    TextStyle? textStyle = Get.theme.textTheme.headline6;
    ThemeApp theme = Get.put(ThemeApp());
    return Expanded(
      child: Container(
        color: Get.theme.primaryColor.withOpacity(0.2),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: const Icon(Icons.supervised_user_circle),
              title: Text(
                'Mutemet İşlemlerim',
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
            const SizedBox(
              height: 20,
            ),
            selectThemeMode(theme),
            const Divider(
              height: 11,
              color: Colors.grey,
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    HiveService().deleteUserBox('personBox');
                    context.router.replace(EntryRoute());
                  },
                  style: ConstButtonStyle.commonButtonStyle(context),
                  child: const Text('ÇIKIŞ'),
                ),
              ),
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
            },
          ),
        ),
      ],
    );
  }
}
