import 'dart:ui';

import 'package:get/get.dart';

class SettingViewModel extends GetxController {
  Rx<Locale> lang = Rx(Get.locale!);

  Future<void> setLanguage(Locale newLang) async {
    lang.value = newLang;
    await Get.updateLocale(newLang);
  }
}
