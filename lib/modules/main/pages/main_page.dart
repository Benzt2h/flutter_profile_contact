import 'package:flutter/material.dart';
import 'package:flutter_profile_contact/modules/main/screens/contact_screen.dart';
import 'package:flutter_profile_contact/modules/main/screens/home_screen.dart';
import 'package:flutter_profile_contact/modules/main/screens/setting_screen.dart';
import 'package:flutter_profile_contact/modules/main/view_model/main_viewmodel.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainPage extends GetView<MainViewModel> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PersistentTabView(
          tabs: [
            PersistentTabConfig(
              screen: ContactScreen(),
              item: ItemConfig(
                icon: Icon(Icons.contact_page),
                title: "Contact",
              ),
            ),
            PersistentTabConfig(
              screen: HomeScreen(),
              item: ItemConfig(
                icon: Icon(Icons.home),
                title: "Home",
              ),
            ),
            PersistentTabConfig(
              screen: SettingScreen(),
              item: ItemConfig(
                icon: Icon(Icons.settings),
                title: "Settings",
              ),
            ),
          ],
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ),
      ),
    );
  }
}
