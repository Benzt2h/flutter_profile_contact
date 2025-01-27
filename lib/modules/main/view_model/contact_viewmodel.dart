import 'package:flutter/material.dart';
import 'package:flutter_profile_contact/models/person_model.dart';
import 'package:get/get.dart';

class ContactViewmodel extends GetxController {
  RxList<PersonModel> listPerson = RxList([]);
  RxList<PersonModel> listPersonFillter = RxList([]);
  final formKey = GlobalKey<FormState>();
  final txtNameController = TextEditingController();
  final txtAgeController = TextEditingController();
  final txtfillterController = TextEditingController();
  RxBool isOnFillter = RxBool(false);

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

  onAddPerson() {
    if (!formKey.currentState!.validate()) return;
    listPerson.insert(
        0,
        PersonModel(
          age: int.parse(txtAgeController.text),
          name: txtNameController.text,
        ));

    txtNameController.clear();
    txtAgeController.clear();
    txtfillterController.clear();
    listPersonFillter.value = listPerson;
    Get.back();
  }

  onClearFillter() {
    txtfillterController.clear();
    listPersonFillter.value = listPerson;
    isOnFillter.value = false;
  }

  onFillter(String txt) {
    if (txt.isNotEmpty) {
      isOnFillter.value = true;
    } else {
      isOnFillter.value = false;
    }
    if (txt.length <= 2) {
      listPersonFillter.value = listPerson;
      return;
    }
    listPersonFillter.value = listPerson
        .where(
          (PersonModel person) => person.name.contains(txt),
        )
        .toList();

    listPersonFillter.refresh();
  }
}
