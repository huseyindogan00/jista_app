// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:jista/data/constant/const_text.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/utility/validation_utility/validation_controller.dart';

import '../../../data/constant/const_assets_images.dart';
import '../../../data/constant/const_button_style.dart';
import '../../../data/constant/const_font_size.dart';
import '../../../core/router/route_name.dart';
import '../../../product/models/person/person_model.dart';
import '../vm/entry_view_model.dart';

class EntryView extends StatelessWidget {
  EntryView({Key? key}) : super(key: key);

  final TextEditingController _epostaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final EntryViewModel entryViewModel = EntryViewModel();
  final PersonModel personModel = PersonModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ConstText.entryPageText),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).backgroundColor,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildLogo(),
                const SizedBox(height: 20),
                pbikTextField(),
                const SizedBox(height: 20),
                passwordTextField(context),
                const SizedBox(height: 30),
                buildLoginButton(context),
                const SizedBox(height: 20),
                buildRegisterButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // LOGO METHODU
  Widget buildLogo() {
    return SizedBox(
      width: 350,
      height: 200,
      child: ConstAssetsImages.logoPath,
    );
  }

  // Username|Eposta|Pbik TEXTFİELD
  Widget pbikTextField() {
    return TextFormField(
      autofocus: false,
      controller: _epostaController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          'Pbik',
          style: TextStyle(fontSize: ConstFontSize.textFieldFS),
        ),
      ),
      validator: (value) {
        return ValidationController.pbikValidation(value);
      },
      onSaved: (newValue) {
        personModel.pbik = newValue?.trim() ?? '';
      },
    );
  }

  // PASSWORD TEXTFİELD
  Widget passwordTextField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          'Şifre',
          style: TextStyle(fontSize: ConstFontSize.textFieldFS),
        ),
      ),
      validator: (value) {
        return ValidationController.passwordValidation(value);
      },
      onSaved: (newValue) {
        personModel.password = newValue?.trim() ?? '';
      },
    );
  }

  // GİRİŞ BUTONU TIKLANDIĞINDA ÇALIŞACAK METHOD
  Widget buildLoginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ConstButtonStyle.entryPageButtonStyle(context),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            ServiceResult result = await EntryViewModel.login(personModel);
            if (result.isSuccess) {
              // HOME SAYFASINA GEÇİŞŞŞŞ
              Get.toNamed(RouteName.homeView, arguments: result);
              //EasyLoading.showToast(result.dataInfo.toString(), duration: const Duration(milliseconds: 2000));
            } else {
              EasyLoading.showError(result.dataInfo.toString());
            }
          }
        },
        child: Text(
          'Giriş',
          style: TextStyle(fontSize: ConstFontSize.textButtonFS),
        ),
      ),
    );
  }

  buildRegisterButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
          style: ConstButtonStyle.entryPageButtonStyle(context),
          onPressed: () async {
            await Navigator.pushNamed(context, RouteName.registerView);
            _buildTextFieldClear();
          },
          child: Text(
            'Kayıt Ol',
            style: TextStyle(fontSize: ConstFontSize.textButtonFS),
          )),
    );
  }

  void _buildTextFieldClear() {
    _epostaController.clear();
    _passwordController.clear();
  }
}
