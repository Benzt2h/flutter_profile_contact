import 'package:flutter_profile_contact/modules/main/view_model/contact_viewmodel.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainViewModel extends GetxController {
  final PersistentTabController bottomNaviController =
      PersistentTabController(initialIndex: 0);
  final int _currentScreenIndex = 0;

  @override
  void onInit() {
    super.onInit();
    Get.put<ContactViewmodel>(ContactViewmodel());
  }
}
