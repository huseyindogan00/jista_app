import 'package:flutter/material.dart';
import 'package:jista/constant/assets_file.dart';
import 'package:jista/constant/button_style_const.dart';
import 'package:jista/constant/fake_data.dart';
import 'package:jista/constant/font_size.dart';
import 'package:jista/constant/margin_const.dart';
import 'package:jista/constant/route_name.dart';
import 'package:jista/constant/text_const.dart';
import 'package:jista/view_model/entry_view_model.dart';

class EntryPage extends StatelessWidget {
  EntryPage({Key? key}) : super(key: key);

  final TextEditingController _pbikController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final EntryViewModel entryViewModel = EntryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(TextConst.entryPageText),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLogo(),
            const SizedBox(height: 20),
            userNameTextField(),
            const SizedBox(height: 20),
            passwordTextField(context),
            const SizedBox(height: 30),
            buildLoginButton(context),
            const SizedBox(height: 20),
            buildRegisterButton(context),
          ],
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

  // USERNAME/EPOSTA TEXTFİELD
  Widget userNameTextField() {
    return TextFormField(
      autofocus: false,
      controller: _pbikController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          'E-posta',
          style: TextStyle(fontSize: FontSize.textFieldFS),
        ),
      ),
    );
  }

  // PASSWORD TEXTFİELD
  Widget passwordTextField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          'Şifre',
          style: TextStyle(fontSize: FontSize.textFieldFS),
        ),
      ),
      validator: (value) {},
    );
  }

  // GİRİŞ BUTONU TIKLANDIĞINDA ÇALIŞACAK METHOD
  Widget buildLoginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyleConst.entryPageButtonStyle,
        onPressed: () {
          // HOME SAYFASINA GEÇİŞ
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
          style: ButtonStyleConst.entryPageButtonStyle,
          onPressed: () async {
            var result =
                await Navigator.pushNamed(context, RouteName.registerPage);
          },
          child: Text(
            'Kayıt Ol',
            style: TextStyle(fontSize: FontSize.textButtonFS),
          )),
    );
  }
}
