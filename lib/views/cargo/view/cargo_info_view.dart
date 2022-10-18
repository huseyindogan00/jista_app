// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jista/core/utility/validation_utility/validation_controller.dart';
import 'package:jista/data/data_model/entities/cities.dart';
import 'package:jista/data/data_model/entities/towns.dart';
import 'package:jista/product/models/address/address_model.dart';
import 'package:jista/views/cargo/view_model/cargo_info_view_model.dart';

class CargoInfoView extends StatefulWidget {
  CargoInfoView({super.key});

  @override
  State<CargoInfoView> createState() => _CargoInfoViewState();
}

class _CargoInfoViewState extends State<CargoInfoView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cityController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController mobileTelephoneNumberController =
      TextEditingController();
  TextEditingController telephoneNumberController = TextEditingController();

  TextStyle hintTextStyle =
      TextStyle(color: Colors.cyan.shade400, fontSize: 18);
  TextStyle dropdownTextStyle = const TextStyle(
      fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold);
  Color dropdownColor = const Color.fromARGB(255, 50, 197, 197);
  Color iconDisabledColor = Colors.grey;
  Color iconEnabledColor = const Color.fromARGB(255, 24, 10, 182);
  BorderRadius dropdownBorderRadius =
      const BorderRadius.all(Radius.circular(20));
  BorderRadius inputBorderRadius = const BorderRadius.all(Radius.circular(10));
  List<TextInputFormatter> textInputFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
  ];
  TextStyle inputErrorTextStyle =
      const TextStyle(color: Colors.amber, fontSize: 14);
  TextStyle inputTextStyle = const TextStyle(color: Colors.black, fontSize: 17);

  late AddressModel addressModel;

  CargoInfoViewModel viewController =
      Get.put<CargoInfoViewModel>(CargoInfoViewModel());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Wrap(
            runSpacing: 35,
            children: <Widget>[
              _buildCityDropdownFormField(),
              Obx(
                () => _buildTownDropdownFormField(),
              ),
              _buildAddressTextField(),
              _buildPostCodeTextField(),
              _buildPhoneTextField(),
              _buildMobilePhoneTextField(),
              _buildSaveButton()
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          AddressModel addres = AddressModel(
            id: null,
            city: cityController.text,
            town: townController.text,
            telephoneNumber: telephoneNumberController.text.trim(),
            mobileTelephoneNumber: mobileTelephoneNumberController.text.trim(),
            fullAddress: fullAddressController.text.trim(),
            postCode: postCodeController.text.trim(),
          );

          print(addres.toString());
        }
      },
      child: const Text('Kaydet'),
    );
  }

  TextFormField _buildMobilePhoneTextField() {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: mobileTelephoneNumberController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        errorStyle: inputErrorTextStyle,
        prefixIcon: const Icon(Icons.phone),
        label: Text('Cep Telefonu', style: hintTextStyle),
        border: OutlineInputBorder(
          borderRadius: inputBorderRadius,
        ),
      ),
      onSaved: (newValue) {
        mobileTelephoneNumberController.text = newValue ?? '';
      },
      validator: (value) {
        return ValidationController.telephoneValidation(value);
      },
    );
  }

  TextFormField _buildPhoneTextField() {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: telephoneNumberController,
      keyboardType: TextInputType.phone,
      inputFormatters: textInputFormatter,
      decoration: InputDecoration(
        errorStyle: inputErrorTextStyle,
        prefixIcon: const Icon(Icons.phone),
        label: Text('Telefon', style: hintTextStyle),
        border: OutlineInputBorder(
          borderRadius: inputBorderRadius,
        ),
      ),
      onSaved: (newValue) {
        telephoneNumberController.text = newValue ?? '';
      },
      validator: (value) {
        return ValidationController.telephoneValidation(value);
      },
    );
  }

  TextFormField _buildPostCodeTextField() {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: postCodeController,
      decoration: InputDecoration(
        errorStyle: inputErrorTextStyle,
        prefixIcon: const Icon(Icons.local_post_office_sharp),
        label: Text('Posta Kodu', style: hintTextStyle),
        border: OutlineInputBorder(
          borderRadius: inputBorderRadius,
        ),
      ),
      onSaved: (newValue) {
        postCodeController.text = newValue ?? '';
      },
      validator: (value) {
        return ValidationController.postaCodeValidation(value);
      },
    );
  }

  TextFormField _buildAddressTextField() {
    return TextFormField(
      style: inputTextStyle,
      controller: fullAddressController,
      maxLines: 5,
      decoration: InputDecoration(
        errorStyle: inputErrorTextStyle,
        prefixIcon: const Icon(Icons.home_filled),
        alignLabelWithHint: true,
        label: Text('Adres', style: hintTextStyle),
        border: OutlineInputBorder(
          borderRadius: inputBorderRadius,
        ),
      ),
      onSaved: (newValue) {
        fullAddressController.text = newValue ?? '';
      },
      validator: (value) {
        return ValidationController.fullAddressValidation(value);
      },
    );
  }

  // OBX İÇİNDE
  SizedBox _buildTownDropdownFormField() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: DropdownButtonFormField<String>(
        value: viewController.townFirstValue.value,
        decoration: InputDecoration(
          label: Text('İlçe Seçiniz', style: hintTextStyle),
          border: OutlineInputBorder(borderRadius: inputBorderRadius),
        ),
        menuMaxHeight: 400,
        borderRadius: dropdownBorderRadius,
        dropdownColor: dropdownColor,
        iconSize: 30,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        items: viewController.townList?.value,
        onChanged: (value) {
          print(value);
        },
        onSaved: (town) {
          townController.text = town ?? '';
        },
      ),
    );
  }

  SizedBox _buildCityDropdownFormField() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          label: Text('İl Seçiniz', style: hintTextStyle),
          border: OutlineInputBorder(borderRadius: inputBorderRadius),
        ),
        menuMaxHeight: 400,
        borderRadius: dropdownBorderRadius,
        dropdownColor: dropdownColor,
        iconSize: 30,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        items: getCity(),
        onChanged: (cityKey) {
          getTowns(cityKey!);
          print(viewController.townList?.value);
        },
        onSaved: (newValue) {
          cityController.text = newValue ?? '';
          print(newValue);
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getCity() {
    return Cities.citiesList.entries.map(
      (cityMap) {
        return DropdownMenuItem(
          value: cityMap.key,
          child: Text(
            '${cityMap.key} - ${cityMap.value}',
            style: dropdownTextStyle,
          ),
        );
      },
    ).toList();
  }

  void getTowns(String cityKey) {
    List<String> townList = Towns.townsList[cityKey]!;
    viewController.townFirstValue.value = townList.first;
    viewController.townList?.value = townList
        .map<DropdownMenuItem<String>>((town) => DropdownMenuItem(
              value: town,
              child: Text(
                town,
                style: dropdownTextStyle,
              ),
            ))
        .toList();
  }
}
