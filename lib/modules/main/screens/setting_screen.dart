import 'package:flutter/material.dart';
import 'package:flutter_profile_contact/modules/main/view_model/setting_viewmodel.dart';
import 'package:flutter_profile_contact/utils/lang/translation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingViewModel> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.w,
        horizontal: 10.h,
      ),
      child: Column(
        children: [
          _buildChangeLanguage(),
        ],
      ),
    );
  }

  Widget _buildChangeLanguage() {
    return Column(
      children: [
        Text("change_language".tr),
        RadioListTile(
          title: Text("ไทย"),
          value: AppTranslation.th,
          groupValue: controller.lang.value,
          onChanged: (value) async {
            await controller.setLanguage(value!);
          },
        ),
        RadioListTile(
          title: Text("Eng"),
          value: AppTranslation.en,
          groupValue: controller.lang.value,
          onChanged: (value) async {
            await controller.setLanguage(value!);
          },
        ),
      ],
    );
  }
}
