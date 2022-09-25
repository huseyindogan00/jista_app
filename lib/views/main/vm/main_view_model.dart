import 'package:get/get.dart';

class MainViewModel extends GetxController {
  RxInt selectIndex = 0.obs;
  RxBool isAppbarLeading = false.obs; // CATEGORY sayfasından geri anasayfaya dönmek için iconu aktif eder

  RxString appbarTitle = ''.obs;

  currentIndex(int index) {
    selectIndex.value = index;
  }

  changeAppbarLeading(bool value) {
    isAppbarLeading.value = value;
  }
}
