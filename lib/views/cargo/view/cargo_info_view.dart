import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/data/data_model/entities/cities.dart';
import 'package:jista/data/data_model/entities/towns.dart';
import 'package:jista/views/cargo/view_model/cargo_info_view_model.dart';

class CargoInfoView extends StatelessWidget {
  CargoInfoView({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CargoInfoViewModel controller =
      Get.put<CargoInfoViewModel>(CargoInfoViewModel());

  List<DropdownMenuItem<String>> getCity() {
    return Cities.citiesList.entries.map(
      (cityMap) {
        return DropdownMenuItem(
          value: cityMap.key,
          child: Text(
            '${cityMap.key}-${cityMap.value}',
            style: Get.theme.textTheme.headline6
                ?.copyWith(fontSize: 16, color: Colors.black),
          ),
        );
      },
    ).toList();
  }

  getTown(String cityId) {
    Towns.townsList.entries
        .where((entries) => entries.key == cityId)
        .map<List<String>>((townList) {
      return controller.townList?.value = townList.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              hint: const Text('Şehir Seçiniz'),
              items: getCity(),
              onChanged: (cityId) {
                print(cityId);
                getTown(controller.cityId.value);
              },
            ),
            DropdownButton<String>(
              hint: const Text('Şehir Seçiniz'),
              items: controller.townList?.value,
              onChanged: (city) {},
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Kaydet'),
            )
          ],
        ),
      ),
    );
  }
}
