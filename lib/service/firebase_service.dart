import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jista/model/user_model.dart';
import 'package:jista/service/base/firebase_service_interface.dart';
import 'package:jista/utility/show_snacbar.dart';

class FirebaseService extends FirebaseServiceInterface {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  delete(UserModel userModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> save(UserModel userModel, BuildContext context) async {
    try {
      // USERCREDENTİAL'e FIREBASEAUTH  ile oluşturduğumuz kimliği atıyoruz.
      // Firebase bizim için bu kullanıcıyı veritabanına kaydediyor.
      // Eğer kayıt daha önce varsa veya şifre yetersizse hata mesajı ile kullanıcıyı bilgilendiriyoruz.
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );
      User? user = userCredential.user!;
      // Firebase de kullanıcıyı oluştururken sadece email ve şifre ile oluşturabiliriz.
      // Geri kalan user bilgilerini USER nesnesi üzerinden update ederek atarız.
      user.updateDisplayName(userModel.name);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ShowSnacbar.showInfoWithSnacbar(context, 'Parola çok zayıf.');
        print('Parola çok zayıf.');
      } else if (e.code == 'email-already-in-use') {
        ShowSnacbar.showInfoWithSnacbar(
            context, 'Bu eposta ile daha önce hesap oluşturulmuş.');
        print('Bu eposta ile daha önce hesap oluşturulmuş.');
      }
    } catch (e) {
      print('******************************************** $e');
    }
    return false;
  }

  @override
  update(UserModel userModel) {
    throw UnimplementedError();
  }
}
