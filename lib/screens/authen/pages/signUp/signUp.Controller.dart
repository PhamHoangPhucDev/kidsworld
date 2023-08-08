import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kidsworld/components/alert/alert.Component.dart';
import 'package:kidsworld/models/apps/userInfo.Model.dart';

import '../../../../blocs/auth.Bloc.dart';
import '../../authen.Controller.dart';

class SignUpController extends GetxController {
    static SignUpController get instance => Get.find();

  late BuildContext context;
  
  AuthBloc authBloc = AuthBloc(); 
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    authBloc.dispose();
    super.onClose();
  }

  clearController(){
    emailController.clear();
    passController.clear();
    passConfirmController.clear();
    nameController.clear();
    phoneController.clear();
  }

  addListenerSink(){
    authBloc.emailSink.add(emailController.text);
    emailController.addListener(() {
      authBloc.emailSink.add(emailController.text);
    });
    authBloc.passSink.add(passController.text);
    passController.addListener(() {
      authBloc.passSink.add(passController.text);
      authBloc.passConfirmSink.add({
        "pass" : passController.text,
        "passConfirm":passConfirmController.text
      });
    });
    authBloc.passConfirmSink.add({
      "pass" : passController.text,
      "passConfirm":passConfirmController.text
    });
    passConfirmController.addListener(() {
      authBloc.passConfirmSink.add({
        "pass" : passController.text,
        "passConfirm":passConfirmController.text
      });
    });
    authBloc.nameSink.add(nameController.text);
    nameController.addListener(() {
      authBloc.nameSink.add(nameController.text);
    });
    authBloc.phoneSink.add(phoneController.text);
    phoneController.addListener(() {
      authBloc.phoneSink.add(phoneController.text);
    });
  }

   void onSignUpClick() {
    final user = UserInfoModel(
      email: emailController.text.trim(),
      password: passController.text.trim(),
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      token: AuthenController.instance.deviceInfo.identifier
    );
    if(authBloc.isValid(email:emailController.text, pass:passController.text, passConfirmController.text, nameController.text, phoneController.text)){
      EasyLoading.show(status: 'Loading...');
      authBloc.signUp(user,(){
        AuthenController.instance.deleteSignInUp();
        EasyLoading.dismiss();
        print("Tạo thành công");
      },
      (msg) {
        EasyLoading.dismiss();
        Alert.showMsgDialog(context, title:"Sign-Up", msg);
      }
    );
    } else {
      addListenerSink();
    }
  }
}