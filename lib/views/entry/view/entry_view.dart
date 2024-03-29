// ignore_for_file: must_be_immutable, unused_element

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jista/core/router/auto_router/router.gr.dart';
import 'package:jista/data/constant/const_assets_images.dart';
import 'package:jista/data/constant/style/const_button_style.dart';
import 'package:jista/data/constant/style/const_font_size.dart';
import 'package:jista/data/constant/style/const_text.dart';
import 'package:jista/core/services/service_result/base/service_result.dart';
import 'package:jista/core/utility/validation_utility/validation_controller.dart';
import 'package:jista/product/models/person/person_model.dart';
import 'package:jista/views/entry/view_model/entry_view_model.dart';
import 'package:provider/provider.dart';

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
                _LoginButton(formKey: formKey, personModel: personModel),
                const SizedBox(height: 20),
                buildExitButton(context), // KAYIT EKLEME YAPILABİLİR
                //buildRegisterButton(context),
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

  Widget buildExitButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
          style: ConstButtonStyle.commonButtonStyle(context),
          onPressed: () {
            exit(1);
            //_buildTextFieldClear();
          },
          child: Text(
            'Çıkış',
            style: TextStyle(fontSize: ConstFontSize.textButtonFS),
          )),
    );
  }

  /* Widget buildRegisterButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
          style: ConstButtonStyle.commonButtonStyle(context),
          onPressed: () {
            context.router.push(RegisterRoute());
            _buildTextFieldClear();
          },
          child: Text(
            'Kayıt Ol',
            style: TextStyle(fontSize: ConstFontSize.textButtonFS),
          )),
    );
  } */

  void _buildTextFieldClear() {
    _epostaController.clear();
    _passwordController.clear();
  }
}

// GİRİŞ BUTONU TIKLANDIĞINDA ÇALIŞACAK METHOD

class _LoginButton extends StatelessWidget {
  _LoginButton({super.key, required this.personModel, required this.formKey});

  PersonModel personModel;
  GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ElevatedButton(
            style: ConstButtonStyle.commonButtonStyle(context),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                ServiceResult result = await viewModel.login(personModel);
                if (result.isSuccess) {
                  // HOME SAYFASINA GEÇİŞŞŞŞ
                  context.router.replace(const BaseTabsRoute());
                  //Get.offAndToNamed(RouteName.homeView, arguments: result.data);
                  //EasyLoading.showToast(result.dataInfo.toString(), duration: const Duration(milliseconds: 2000));
                } else {
                  EasyLoading.showError(result.dataInfo.toString());
                }
              }
            },
            child: viewModel.isloading
                ? const CircularProgressIndicator()
                : Text('Giriş', style: TextStyle(fontSize: ConstFontSize.textButtonFS)),
          ),
        );
      },
    );
  }
}
