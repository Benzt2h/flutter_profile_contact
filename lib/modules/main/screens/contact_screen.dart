import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_contact/models/person_model.dart';
import 'package:flutter_profile_contact/modules/main/view_model/contact_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactScreen extends GetView<ContactViewmodel> {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFillerBar(),
        _buildPersonList(),
      ],
    );
  }

  Widget _buildFillerBar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            await _buildDialogAddPerson().show();
          },
          child: Icon(Icons.add),
        )
      ],
    );
  }

  Widget _buildPersonList() {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          itemCount: controller.listPerson.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (context, index) {
            PersonModel person = controller.listPerson[index];
            return Row(children: [
              Flexible(
                  child: Text(
                person.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )),
              Text(" อายุ: ${person.age}")
            ]);
          },
        ),
      ),
    );
  }

  AwesomeDialog _buildDialogAddPerson() {
    return AwesomeDialog(
      context: Get.context!,
      headerAnimationLoop: false,
      dialogType: DialogType.noHeader,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      autoDismiss: false,
      onDismissCallback: (type) {},
      title: "Add Contact",
      body: Container(
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
            child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.txtNameController,
                decoration: InputDecoration(
                  labelText: 'ชื่อ-นามสกุล',
                  border: OutlineInputBorder(),
                ),
                validator: controller.validateName,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: controller.txtAgeController,
                decoration: InputDecoration(
                  labelText: 'อายุ',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: controller.validateAge,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        )),
      ),
      btnOkText: "ปิด",
      btnOkColor: Get.theme.colorScheme.primary,
      btnOkOnPress: () {
        controller.onAddPerson();
      },
      btnCancelText: "ยกเลิก",
      btnCancelColor: Colors.redAccent,
      btnCancelOnPress: () {
        Get.back();
      },
    );
  }
}
