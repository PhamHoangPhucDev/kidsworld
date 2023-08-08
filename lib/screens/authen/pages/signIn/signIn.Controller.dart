import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kidsworld/components/alert/alert.Component.dart';

import '../../../../blocs/auth.Bloc.dart';
import '../../authen.Controller.dart';

class SignInController extends GetxController {
    static SignInController get instance => Get.find();

  RxBool obscured = true.obs;
  late BuildContext context;

  AuthBloc authBloc = AuthBloc(); 
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // authBloc = AppScreen.of(context).authBloc;
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
  }

  addListenerSink(){
    authBloc.emailSink.add(emailController.text);
    emailController.addListener(() {
      authBloc.emailSink.add(emailController.text);
    });
    authBloc.passSink.add(passController.text);
    passController.addListener(() {
      authBloc.passSink.add(passController.text);
    });
  }

  void onSignInClick() {
    EasyLoading.show(status: "Loading...");
    authBloc.signIn(emailController.text, passController.text,AuthenController.instance.deviceInfo.identifier!, (){
      AuthenController.instance.deleteSignInUp();
      EasyLoading.dismiss();
      print("Đăng nhập thành công");
    }, (msg){
      EasyLoading.dismiss();
      Alert.showMsgDialog(context, title:"Sign-In", msg);
      addListenerSink();
    });
  }
}