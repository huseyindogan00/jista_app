// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/init/app_init.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/data/theme/theme_app.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/views/base/base_model.dart';
import 'package:jista/views/cargo/view/trust_view.dart';
import 'package:jista/views/trustee/view/trustee_view.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({
    Key? key,
  }) : super(key: key) {
    initializer();
  }

  BaseModel? controller;
  PersonModel? personModel;
  final ThemeApp theme = Get.put(ThemeApp());
  var hiveService = locator<HiveService>();

  void initializer() async {
    controller = Get.put(BaseModel());
    personModel = await hiveService.getBoxPerson('person');
    controller?.personTotalPoint.value = personModel?.totalPoint ?? 0;
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context, personModel!),
            buildMenuItem(context),
          ],
        ),
      );

  Widget buildHeader(BuildContext context, PersonModel personModel) {
    Color textColor = const Color.fromARGB(255, 230, 230, 236);
    return Container(
      color: Get.theme.backgroundColor.withOpacity(0.9),
      padding: EdgeInsets.only(
        top: 25 + MediaQuery.of(context).padding.top,
        bottom: 10,
      ),
      child: Column(
        children: [
          CircleAvatar(
            minRadius: 50,
            maxRadius: 70,
            backgroundImage: NetworkImage(personModel.imageUrl!),
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
          const Divider(),
          Container(
            padding: const EdgeInsets.only(top: 0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Toplam Puan : ',
                  style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500, fontSize: 20),
                ),
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance.collection('person').doc(personModel.id).snapshots(),
                  builder: (context, snapshot) {
                    Map<String, dynamic>? data = snapshot.data?.data();
                    if (!snapshot.hasData || snapshot.data == null) {
                      return const Text('Yükleniyor');
                    } else {
                      PersonModel _personModel = personModel;
                      _personModel.totalPoint = data!['totalPoint'];
                      hiveService.saveBoxPerson(personModel);
                      return Text(
                        data['totalPoint'].toString(),
                        style: TextStyle(color: Colors.cyan.shade300, fontSize: 25, fontWeight: FontWeight.w500),
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context) {
    TextStyle? textStyle = Get.theme.textTheme.headline6;
    double iconSize = 38;

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Get.theme.backgroundColor.withOpacity(0.3),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                leading: Icon(Icons.square_foot_outlined, size: iconSize),
                title: Text(
                  'Ölçü Bilgilerim (EKLENECEK)',
                  style: textStyle,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle, size: iconSize),
                title: Text(
                  'Mutemet İşlemlerim (Ekleniyor...)',
                  style: textStyle,
                ),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrusteeView(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.boy_outlined, size: iconSize),
                title: Text(
                  'Beden Ölçüleri Tespit Broşürü (EKLENECEK)',
                  style: textStyle,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.plagiarism, size: iconSize),
                title: Text('İstihkak Kargo İhalesi Fiyat Cetveli (EKLENECEK)', style: textStyle),
                onTap: () {},
              ),
              const SizedBox(height: 5),
              //selectThemeMode(theme),
              const Divider(color: Colors.grey),
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
                            locator<HiveService>().deleteUserBoxPerson('personBox');
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
