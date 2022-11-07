import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/core/services/service/firebase_store_service.dart';
import 'package:jista/core/services/service/hive_service.dart';
import 'package:jista/data/constant/appbar_text/appbar_title.dart';
import 'package:jista/data/constant/font/const_text_style.dart';
import 'package:jista/main.dart';
import 'package:jista/product/models/address/address_model.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/product/widget/my_appbar_widget.dart';
import 'package:jista/product/widget/navigation_drawer_widget.dart';

class CargoInfoView extends StatelessWidget {
  CargoInfoView({super.key}) {
    getBoxPerson();
  }
  var box = locator<HiveService>();
  PersonModel? personModel;

  getBoxPerson() async {
    personModel = await box.getBoxPerson('person');

    //addressModel = personModel?.address;
  }

  final _listTileTextStyle = Get.theme.textTheme.headline5?.copyWith(
      color: const Color.fromARGB(255, 136, 52, 6),
      fontFamily: ConstTextStyle.fontFamilyMontserrat);

  final _listTileLeadingStyle =
      Get.theme.textTheme.headline4?.copyWith(color: Colors.black);

  ///AddressModel? addressModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWiget.createAppbar(title: AppbarTitle.cargoInfoPageTitle)
          .getAppBar(context),
      drawer: NavigationDrawer(),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('person')
            .doc(personModel?.id)
            .collection('address')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.data == null) {
            return Center(
              child: Text('Adres Bilgilerinizi Giriniz',
                  style: Get.theme.textTheme.headline4),
            );
          } else {
            QueryDocumentSnapshot<Map<String, dynamic>>? addresQuery =
                snapshot.data?.docs.first;

            AddressModel addressModel =
                AddressModel.fromMap(addresQuery!.data());
            addressModel.id = addresQuery.id;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Form(
                child: Container(
                  color: const Color.fromARGB(255, 248, 245, 245),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          _listTileCity(addressModel),
                          _listTileTown(addressModel),
                          _listTileFullAddress(addressModel),
                          _listTilePostCode(addressModel),
                          _listTileTelephoneNumber(addressModel),
                          _listTileMobileTelephoneNumber(addressModel),
                        ],
                      ),
                      SizedBox(height: 20),
                      _rowUpdateButton(context, addressModel)
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Row _rowUpdateButton(BuildContext context, AddressModel addressModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 36, 158, 124)),
          onPressed: () {
            context.router.push(CargoEditRouter(addressModel: addressModel));
          },
          child: const Text(
            'Güncelle',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )
      ],
    );
  }

  ListTile _listTileMobileTelephoneNumber(AddressModel addressModel) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      minLeadingWidth: 140,
      leading: Text(
        'Cep Telefonu :',
        style: _listTileLeadingStyle,
      ),
      title: Text(
        addressModel.mobileTelephoneNumber,
        style: _listTileTextStyle,
      ),
    );
  }

  ListTile _listTileTelephoneNumber(AddressModel addressModel) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      minLeadingWidth: 140,
      leading: Text(
        'Telefon :',
        style: _listTileLeadingStyle,
      ),
      title: Text(
        addressModel.telephoneNumber,
        style: _listTileTextStyle,
      ),
    );
  }

  ListTile _listTilePostCode(AddressModel addressModel) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      minLeadingWidth: 140,
      leading: Text(
        'Posta Kodu :',
        style: _listTileLeadingStyle,
      ),
      title: Text(
        addressModel.postCode,
        style: _listTileTextStyle,
      ),
    );
  }

  ListTile _listTileFullAddress(AddressModel addressModel) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      minLeadingWidth: 140,
      leading: Text(
        'Adres :',
        style: _listTileLeadingStyle,
      ),
      title: Text(
        addressModel.fullAddress,
        style: _listTileTextStyle,
      ),
    );
  }

  ListTile _listTileTown(AddressModel addressModel) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      minLeadingWidth: 140,
      leading: Text(
        'İlçe :',
        style: _listTileLeadingStyle,
      ),
      title: Text(
        addressModel.town,
        style: _listTileTextStyle,
      ),
    );
  }

  ListTile _listTileCity(AddressModel addressModel) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      minLeadingWidth: 140,
      leading: Text('İl :', style: _listTileLeadingStyle),
      title: Text(
        addressModel.city,
        style: _listTileTextStyle,
      ),
    );
  }
}
