import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:jista/model/service_result.dart';
import 'package:jista/model/user_model.dart';
import 'package:jista/service/base/firebase_service_interface.dart';

class FirebaseService extends FirebaseServiceInterface {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  delete(UserModel userModel) {
    throw UnimplementedError();
  }

  @override
  Future<ServiceResult> save(UserModel userModel) async {
    try {
      // USERCREDENTİAL'e FIREBASEAUTH  ile oluşturduğumuz kimliği atıyoruz.
      // Firebase bizim için bu kullanıcıyı veritabanına kaydediyor.
      // Eğer kayıt daha önce varsa veya şifre yetersizse hata mesajı ile kullanıcıyı bilgilendiriyoruz.

      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );

      if (userCredential.user != null) {
        User user = userCredential.user!;
        // Firebase de kullanıcıyı oluştururken sadece email ve şifre ile oluşturabiliriz.
        // Geri kalan user bilgilerini USER nesnesi üzerinden update ederek atarız.
        await user.updateDisplayName(userModel.name);
        await user.sendEmailVerification();

        return Future.value(ServiceResult.factory(
            isSuccess: true, dataInfo: 'İşlem başarılı.'));
      } else {
        return Future.value(ServiceResult.factory(
            isSuccess: false, dataInfo: 'İşlem başarısız.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //ShowSnacbar.showInfoWithSnacbar(context, 'Parola çok zayıf.');
        return Future.value(ServiceResult.factory(
            dataInfo: 'Parola çok zayıf', isSuccess: false));
      } else if (e.code == 'email-already-in-use') {
        //ShowSnacbar.showInfoWithSnacbar(context, 'Bu eposta ile daha önce hesap oluşturulmuş.');
        return Future.value(ServiceResult.factory(
          dataInfo: 'Bu eposta ile daha önce hesap oluşturulmuş.',
          isSuccess: false,
        ));
      }
    } catch (e) {
      return Future.value(
          ServiceResult.factory(dataInfo: '', isSuccess: false));
    }

    return Future.value(
        ServiceResult.factory(dataInfo: 'BOŞ', isSuccess: false));
  }

  @override
  update(UserModel userModel) {
    throw UnimplementedError();
  }
}
