import 'package:ecommerce/core/class/statuscode.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;

  LoginData loginData = LoginData(Get.find());
  showpassword() {
    // isshowpassword == true ? false : true;
    if (isshowpassword == true) {
      isshowpassword = false;
    } else if (isshowpassword == false) {
      isshowpassword = true;
    }
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=====================================Controller ${response}");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "failure") {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(title: "47".tr, middleText: "51".tr);
        } else {
          // data.addAll(response['status']);
          Get.offNamed(
            AppRoute.homepage,
          );
        }
      }
      update();
      // Get.delete<SignUpControllerImp>();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
