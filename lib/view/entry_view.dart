import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jista/constant/assets_file.dart';
import 'package:jista/constant/button_style_const.dart';
import 'package:jista/constant/font_size.dart';
import 'package:jista/constant/route_name.dart';
import 'package:jista/constant/text_const.dart';
import 'package:jista/model/service_result.dart';
import 'package:jista/model/entities/user_model.dart';
import 'package:jista/utility/validation_utility/validation_controller.dart';
import 'package:jista/view_model/entry_view_model.dart';

class EntryPage extends StatelessWidget {
  EntryPage({Key? key}) : super(key: key);

  final TextEditingController _epostaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final EntryViewModel entryViewModel = EntryViewModel();
  final UserModel userModel = UserModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(TextConst.entryPageText),
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
                emailTextField(),
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
      child: AssetsFile.logoPath,
    );
  }

  // Username|Eposta|Pbik TEXTFİELD
  Widget emailTextField() {
    return TextFormField(
      autofocus: false,
      controller: _epostaController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          'E posta',
          style: TextStyle(fontSize: FontSize.textFieldFS),
        ),
      ),
      validator: (value) {
        return ValidationController.emailValidation(value);
      },
      onSaved: (newValue) {
        userModel.email = newValue?.trim() ?? '';
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
          style: TextStyle(fontSize: FontSize.textFieldFS),
        ),
      ),
      validator: (value) {
        return ValidationController.passwordValidation(value);
      },
      onSaved: (newValue) {
        userModel.password = newValue?.trim() ?? '';
      },
    );
  }

  // GİRİŞ BUTONU TIKLANDIĞINDA ÇALIŞACAK METHOD
  Widget buildLoginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyleConst.entryPageButtonStyle(context),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            ServiceResult result = await EntryViewModel.login(userModel);
            if (result.isSuccess) {
              // HOME SAYFASINA GEÇİŞŞŞŞ
              Navigator.pushReplacementNamed(context, '/homePage');
              //EasyLoading.showToast(result.dataInfo.toString(), duration: const Duration(milliseconds: 2000));
            } else {
              EasyLoading.showError(result.dataInfo.toString());
            }
          }
        },
        child: Text(
          'Giriş',
          style: TextStyle(fontSize: FontSize.textButtonFS),
        ),
      ),
    );
  }

  buildRegisterButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
          style: ButtonStyleConst.entryPageButtonStyle(context),
          onPressed: () async {
            await Navigator.pushNamed(context, RouteName.registerPage);
            _buildTextFieldClear();
          },
          child: Text(
            'Kayıt Ol',
            style: TextStyle(fontSize: FontSize.textButtonFS),
          )),
    );
  }

  void _buildTextFieldClear() {
    _epostaController.clear();
    _passwordController.clear();
  }
}
