import 'package:firebase_auth/firebase_auth.dart';
import 'package:jista/model/entities/user_model.dart';
import 'package:jista/model/service_result.dart';
import 'package:jista/services/base/firebase_service_interface.dart';

class FirebaseService extends FirebaseServiceInterface {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<ServiceResult> save(UserModel userModel) async {
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
          ServiceResult(isSuccess: true, dataInfo: 'Kullanıcı kaydı başarılı.'),
        );
      } else {
        return Future.value(
          ServiceResult(isSuccess: false, dataInfo: 'Kullanıcı kaydı yapılamadı.'),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // -> ShowSnacbar.showInfoWithSnacbar(context, 'Parola çok zayıf.');
        return Future.value(ServiceResult(dataInfo: 'Parola çok zayıf', isSuccess: false));
      } else if (e.code == 'email-already-in-use') {
        // -> ShowSnacbar.showInfoWithSnacbar(context, 'Bu eposta ile daha önce hesap oluşturulmuş.');
        return Future.value(ServiceResult(
          dataInfo: 'Bu eposta ile daha önce hesap oluşturulmuş.',
          isSuccess: false,
        ));
      }
    } catch (e) {
      return Future.value(ServiceResult(dataInfo: '', isSuccess: false));
    }

    return Future.value(ServiceResult(dataInfo: 'Try Catch dışı', isSuccess: false));
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
  Future<ServiceResult> login(UserModel userModel) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(email: userModel.email!, password: userModel.password!);

      if (userCredential.user != null) {
        User user = userCredential.user!;
        return ServiceResult(
            dataInfo: 'Giriş Yapıldı\n${user.emailVerified ? 'email doğrulandı' : ' email doğrulanmadı'}',
            isSuccess: true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ServiceResult(dataInfo: 'Kullanıcı bulunamadı!', isSuccess: false);
      } else if (e.code == 'wrong-password') {
        return ServiceResult(dataInfo: 'Yanlış şifre girdiniz.', isSuccess: false);
      }
    } catch (e) {
      return ServiceResult(dataInfo: e.toString(), isSuccess: false);
    }
    return ServiceResult(dataInfo: 'TryCatch end', isSuccess: false);
  }

  // -> KULLANICI E POSTA ADRESİNE GÖNDERİLEN BAĞLANTIYI ONAYLAMIŞ MI
  @override
  isEmailVerified(User user) {
    // TODO: implement isEmailVerified
    throw UnimplementedError();
  }
}
