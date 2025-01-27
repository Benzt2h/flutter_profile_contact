import 'package:flutter/material.dart';
import 'package:flutter_profile_contact/models/person_model.dart';
import 'package:get/get.dart';

class ContactViewmodel extends GetxController {
  RxList<PersonModel> listPerson = RxList([]);
  final formKey = GlobalKey<FormState>();
  final txtNameController = TextEditingController();
  final txtAgeController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกชื่อ-นามสกุล';
    }
    if (!RegExp(r'^[ก-๙a-zA-Z\s]+$').hasMatch(value)) {
      return 'ชื่อ-นามสกุลต้องประกอบด้วยตัวอักษรเท่านั้น';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกอายุ';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'อายุต้องเป็นตัวเลขเท่านั้น';
    }
    int age = int.parse(value);
    if (age <= 0) {
      return 'กรุณากรอกอายุที่เหมาะสม ';
    }
    return null;
  }

  Future<void> onAddPerson() async {
    if (!formKey.currentState!.validate()) return;
    listPerson.insert(
        0,
        PersonModel(
          age: int.parse(txtAgeController.text),
          name: txtNameController.text,
        ));

    txtNameController.clear();
    txtAgeController.clear();
    Get.back();
  }
}
