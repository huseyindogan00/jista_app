// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jista/core/services/service_result/firebase_service_result_model.dart';
import 'package:jista/core/utility/validation_utility/validation_controller.dart';

import '../../../data/constant/style/const_button_style.dart';
import '../../../data/constant/style/const_font_size.dart';
import '../../../data/constant/distance/const_margin.dart';
import '../../../product/models/person/person_model.dart';
import '../view_model/register_view_model.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final PersonModel personModel = PersonModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Sayfası'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              buildNameTextField(),
              buildEmailTextField(),
              buildPasswordTextField(),
              buildRegisterButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameTextField() {
    return Container(
      margin: ConstMargin.entryMargin,
      child: TextFormField(
        autofocus: true,
        controller: nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          label: Text(
            'Ad-Soyad',
            style: TextStyle(fontSize: ConstFontSize.textFieldFS),
          ),
        ),
        validator: (value) {
          return ValidationController.nameValidation(value);
        },
        onSaved: (newValue) {
          personModel.name = newValue!.trim();
        },
      ),
    );
  }

  buildEmailTextField() {
    return Container(
      margin: ConstMargin.entryMargin,
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(
            'Email',
            style: TextStyle(fontSize: ConstFontSize.textFieldFS),
          ),
        ),
        validator: (value) {
          return ValidationController.emailValidation(value);
        },
        onSaved: (newValue) {
          personModel.email = newValue!.trim();
        },
      ),
    );
  }

  buildPasswordTextField() {
    return Container(
      margin: ConstMargin.entryMargin,
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
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
          personModel.password = newValue?.trim();
        },
      ),
    );
  }

  buildRegisterButton(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: ConstMargin.entryMargin,
      child: ElevatedButton(
          style: ConstButtonStyle.commonButtonStyle(context),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              EasyLoading.show();
              bool isConnect = await RegisterViewModel().internetControl();
              if (isConnect) {
                formKey.currentState?.save();
                /* AŞAĞIDAKİ Do not use BuildContexts across async gaps 
                HATASINI GİDER İLERİDE PROBLEM ÇIKARABİLİR*/
                FirebaseServiceResultModel result = await RegisterViewModel.savePerson(personModel);
                if (result.isSuccess) {
                  EasyLoading.showSuccess(result.dataInfo.toString());
                } else {
                  EasyLoading.showInfo(result.dataInfo.toString());
                }
              }
            }
            EasyLoading.dismiss();
            //Navigator.of(context).pop();
            context.router.pop();
          },
          child: Text(
            'Kaydet',
            style: TextStyle(fontSize: ConstFontSize.textButtonFS),
          )),
    );
  }
}
