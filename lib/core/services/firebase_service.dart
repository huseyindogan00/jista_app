import 'package:firebase_auth/firebase_auth.dart';
import 'package:jista/models/entities_model/user_model.dart';
import 'package:jista/models/service_result_model/firebase_service_result_model.dart';
import 'package:jista/core/services/base/service_interface.dart';

class FirebaseService extends ServiceInterface {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseServiceResultModel> save(UserModel userModel) async {
    try {
      // -> USERCREDENTİAL'e FIREBASEAUTH  ile oluşturduğumuz kimliği atıyoruz.
      // -> Firebase bizim için bu kullanıcıyı veritabanına kaydediyor.
      // -> Eğer kayıt daha önce varsa veya şifre yetersizse hata
      // mesajı ile kullanıcıyı bilgilendiriyoruz.

      // -> KULLANICI KİMLİĞİ oluşturup içindeki KULLANICI bilgisi ile
      // kullanıcının oluşup oluşmadığını kontol ediyoruz
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );

      // -> USER VAR İSE
      if (userCredential.user != null) {
        User user = userCredential.user!;
        // -> Firebase de kullanıcıyı oluştururken sadece email ve şifre ile oluşturabiliriz.
        // -> Geri kalan user bilgilerini USER nesnesi üzerinden update ederek atarız.
        await user.updateDisplayName(userModel.name);
        await user.sendEmailVerification();

        return Future.value(
          FirebaseServiceResultModel(isSuccess: true, dataInfo: 'Kullanıcı kaydı başarılı.'),
        );
      } else {
        return Future.value(
          FirebaseServiceResultModel(isSuccess: false, dataInfo: 'Kullanıcı kaydı yapılamadı.'),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // -> ShowSnacbar.showInfoWithSnacbar(context, 'Parola çok zayıf.');
        return Future.value(FirebaseServiceResultModel(dataInfo: 'Parola çok zayıf', isSuccess: false));
      } else if (e.code == 'email-already-in-use') {
        // -> ShowSnacbar.showInfoWithSnacbar(context, 'Bu eposta ile daha önce hesap oluşturulmuş.');
        return Future.value(FirebaseServiceResultModel(
          dataInfo: 'Bu eposta ile daha önce hesap oluşturulmuş.',
          isSuccess: false,
        ));
      }
    } catch (e) {
      return Future.value(FirebaseServiceResultModel(dataInfo: '', isSuccess: false));
    }

    return Future.value(FirebaseServiceResultModel(dataInfo: 'Try Catch dışı', isSuccess: false));
  }

  @override
  delete(UserModel userModel) {
    throw UnimplementedError();
  }

  @override
  update(UserModel userModel) {
    throw UnimplementedError();
  }

  // -> KULLANICI girişi yapma
  @override
  Future<FirebaseServiceResultModel> login(UserModel userModel) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(email: userModel.email!, password: userModel.password!);

      if (userCredential.user != null) {
        User user = userCredential.user!;
        return FirebaseServiceResultModel(
            dataInfo: 'Giriş Yapıldı\n${user.emailVerified ? 'email doğrulandı' : ' email doğrulanmadı'}',
            isSuccess: true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return FirebaseServiceResultModel(dataInfo: 'Kullanıcı bulunamadı!', isSuccess: false);
      } else if (e.code == 'wrong-password') {
        return FirebaseServiceResultModel(dataInfo: 'Yanlış şifre girdiniz.', isSuccess: false);
      }
    } catch (e) {
      return FirebaseServiceResultModel(dataInfo: e.toString(), isSuccess: false);
    }
    return FirebaseServiceResultModel(dataInfo: 'TryCatch end', isSuccess: false);
  }

  // -> KULLANICI E POSTA ADRESİNE GÖNDERİLEN BAĞLANTIYI ONAYLAMIŞ MI
  @override
  isEmailVerified(User user) {
    // TODO: implement isEmailVerified
    throw UnimplementedError();
  }
}
