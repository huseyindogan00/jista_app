import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/data/constant/font/const_text_style.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/address/address_model.dart';
import 'package:jista/product/models/person/person_model.dart';

class CargoInfoView extends StatelessWidget {
  CargoInfoView({super.key}) {
    getBoxPerson();
  }

  getBoxPerson() async {
    PersonModel? personModel = await box.getBoxPerson('person');

    addressModel = personModel?.address;
  }

  var box = locator<HiveService>();
  AddressModel? addressModel;

  @override
  Widget build(BuildContext context) {
    return addressModel == null
        ? Center(
            child: Text('Adres Bilgilerinizi Giriniz',
                style: Get.theme.textTheme.headline4),
          )
        : Form(
            child: Container(
              color: const Color.fromARGB(255, 248, 245, 245),
              child: Column(
                children: [
                  Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(8),
                        minLeadingWidth: 140,
                        leading: Text('İl :',
                            style: Get.theme.textTheme.headline4
                                ?.copyWith(color: Colors.black)),
                        title: Text(
                          addressModel!.city,
                          style: Get.theme.textTheme.headline5?.copyWith(
                              color: Color.fromARGB(255, 136, 52, 6),
                              fontFamily: ConstTextStyle.fontFamilyMontserrat),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(8),
                        minLeadingWidth: 140,
                        leading: Text(
                          'İlçe :',
                          style: Get.theme.textTheme.headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        title: Text(
                          addressModel!.town,
                          style: Get.theme.textTheme.headline5?.copyWith(
                              color: Color.fromARGB(255, 136, 52, 6),
                              fontFamily: ConstTextStyle.fontFamilyMontserrat),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(8),
                        minLeadingWidth: 140,
                        leading: Text(
                          'Adres :',
                          style: Get.theme.textTheme.headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        title: Text(
                          addressModel!.fullAddress,
                          style: Get.theme.textTheme.headline5?.copyWith(
                              color: Color.fromARGB(255, 136, 52, 6),
                              fontFamily: ConstTextStyle.fontFamilyMontserrat),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(8),
                        minLeadingWidth: 140,
                        leading: Text(
                          'Posta Kodu :',
                          style: Get.theme.textTheme.headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        title: Text(
                          addressModel!.postCode,
                          style: Get.theme.textTheme.headline5?.copyWith(
                              color: Color.fromARGB(255, 136, 52, 6),
                              fontFamily: ConstTextStyle.fontFamilyMontserrat),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(8),
                        minLeadingWidth: 140,
                        leading: Text(
                          'Telefon :',
                          style: Get.theme.textTheme.headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        title: Text(
                          addressModel!.telephoneNumber,
                          style: Get.theme.textTheme.headline5?.copyWith(
                              color: Color.fromARGB(255, 136, 52, 6),
                              fontFamily: ConstTextStyle.fontFamilyMontserrat),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(8),
                        minLeadingWidth: 140,
                        leading: Text(
                          'Cep Telefonu :',
                          style: Get.theme.textTheme.headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        title: Text(
                          addressModel!.mobileTelephoneNumber,
                          style: Get.theme.textTheme.headline5?.copyWith(
                              color: Color.fromARGB(255, 136, 52, 6),
                              fontFamily: ConstTextStyle.fontFamilyMontserrat),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        onPressed: () {
                          context.router.push(CargoEditRouter());
                        },
                        child: const Text(
                          'Güncelle',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
