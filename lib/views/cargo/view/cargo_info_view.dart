import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/data/data_model/entities/cities.dart';
import 'package:jista/data/data_model/entities/towns.dart';
import 'package:jista/views/cargo/view_model/cargo_info_view_model.dart';

class CargoInfoView extends StatelessWidget {
  CargoInfoView({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CargoInfoViewModel controller = Get.put<CargoInfoViewModel>(CargoInfoViewModel());

  buildCity() {
    return Cities.citiesList.entries.map(
      (e) {
        return DropdownMenuItem(
          value: e.key,
          child: Text('${e.key} - ${e.value}'),
        );
      },
    ).toList();
  }

  /*  buildTown(String cityKey) {
    controller.townList.value = Towns.townsList.entries.map(
      (e) {
        if (e.key == cityKey) {
          return DropdownMenuItem(
            value: e.key,
            child: Text('${e.key} - ${e.value}'),
          );
        }
      },
    ).toList();
  } */

  getTown(String cityId) {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Wrap(
          runSpacing: 20,
          runAlignment: WrapAlignment.end,
          children: <Widget>[
            Row(
              children: [
                /* DropdownButton<String>(
                  hint: const Text('Şehir Seçiniz'),
                  items: getCityAll(),
                  onChanged: (city) {
                    getTown(city!);
                  },
                ), */
                /* DropdownButton<String>(
                  hint: const Text('Şehir Seçiniz'),
                  items: getTown(),
                  onChanged: (city) {
                    getTown(city!);
                  },
                ), */
              ],
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
              child: Text('Kaydet'),
            )
          ],
        ),
      ),
    );
  }
}
