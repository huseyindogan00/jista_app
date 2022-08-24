import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jista/constant/font_size.dart';
import 'package:jista/constant/margin_const.dart';
import 'package:jista/model/user_model.dart';
import 'package:jista/utility/internet_connection_control.dart';
import 'package:jista/utility/show_dialog.dart';
import 'package:jista/view_model/register_view_model.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final UserModel _userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
      ),
    );
  }

  Widget buildNameTextField() {
    return Container(
      margin: MarginConst.entryMargin,
      child: TextFormField(
        autofocus: true,
        controller: nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(
            'Ad-Soyad',
            style: TextStyle(fontSize: FontSize.textFieldFS),
          ),
        ),
        validator: (value) {
          if (value != null && value.isNotEmpty && value.length > 3) {
            return null;
          } else {
            return 'isim en az 3 karakte olmalıdır';
          }
        },
        onSaved: (newValue) {
          _userModel.name = newValue!.trim();
        },
      ),
    );
  }

  buildEmailTextField() {
    return Container(
      margin: MarginConst.entryMargin,
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(
            'Email',
            style: TextStyle(fontSize: FontSize.textFieldFS),
          ),
        ),
        validator: (value) {
          if (value != null && value.isNotEmpty && value.contains('@')) {
            return null;
          } else {
            return 'email formatını kontrol edin';
          }
        },
        onSaved: (newValue) {
          _userModel.email = newValue!.trim();
        },
      ),
    );
  }

  buildPasswordTextField() {
    return Container(
      margin: MarginConst.entryMargin,
      child: TextFormField(
        controller: passwordController,
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
        validator: (value) {
          if (value != null && value.isNotEmpty && value.length >= 6) {
            return null;
          } else {
            return 'Şifre en az 6 karakter olmalıdır';
          }
        },
        onSaved: (newValue) {
          _userModel.password = newValue?.trim();
        },
      ),
    );
  }

  buildRegisterButton(BuildContext context) {
    return Container(
      height: 50,
      margin: MarginConst.entryMargin,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              EasyLoading.show();
              bool isConnect = await RegisterViewModel.internetControl();
              print('************************is connect değeri : $isConnect');
              if (isConnect) {
                formKey.currentState?.save();
                /* AŞAĞIDAKİ Do not use BuildContexts across async gaps HATASINI GİDER İLERİDE PROBLEM ÇIKARABİLİR*/
                bool result =
                    await RegisterViewModel.saveUser(_userModel, context);
                if (result) {
                  EasyLoading.showSuccess('Kullanıcı kaydetme başarılı');
                }
                /* else {
                  EasyLoading.showError('Kullanıcı kaydetme başarısız.');
                } */
              } else {
                EasyLoading.showError('İnternet bağlantınızı kontrol edin!');
              }
            }
            EasyLoading.dismiss();
            //Navigator.of(context).pop();
          },
          child: Text(
            'Kaydet',
            style: TextStyle(fontSize: FontSize.textButtonFS),
          )),
    );
  }
}
