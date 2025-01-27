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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
      child: Column(
        children: [
          _buildFillerBar(),
          _buildPersonList(),
        ],
      ),
    );
  }

  Widget _buildFillerBar() {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => TextFormField(
              controller: controller.txtfillterController,
              onChanged: (value) {
                controller.onFillter(value);
              },
              decoration: InputDecoration(
                suffixIcon: !controller.isOnFillter.value
                    ? null
                    : IconButton(
                        onPressed: () {
                          controller.onClearFillter();
                        },
                        icon: Icon(Icons.clear)),
                labelText: 'search'.tr,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
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
          itemCount: controller.listPersonFillter.length,
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
              Text(" ${'age'.tr}: ${person.age}")
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
      title: "add_contact".tr,
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
                  labelText: 'name'.tr,
                  border: OutlineInputBorder(),
                ),
                validator: controller.validateName,
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: controller.txtAgeController,
                decoration: InputDecoration(
                  labelText: 'age'.tr,
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
      btnOkText: "add".tr,
      btnOkColor: Get.theme.colorScheme.primary,
      btnOkOnPress: () {
        controller.onAddPerson();
      },
      btnCancelText: "close".tr,
      btnCancelColor: Colors.redAccent,
      btnCancelOnPress: () {
        Get.back();
      },
    );
  }
}
